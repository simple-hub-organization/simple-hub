import 'dart:collection';
import 'dart:convert';

import 'package:hub/domain/i_hub_server_controller.dart';
import 'package:hub/infrastructure/hub_server/hub_server.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';

class DeviceHelperMethods {
  factory DeviceHelperMethods() => _instance;

  DeviceHelperMethods._singletonContractor();

  static final DeviceHelperMethods _instance =
      DeviceHelperMethods._singletonContractor();

  RequestsAndStatusFromHub dynamicToRequestsAndStatusFromHub(
    RequestsAndStatusFromHub entityDto,
  ) {
    // if (entityDto is DeviceEntityDtoBase) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.entityType.name,
    //     allRemoteCommands: DeviceHelper.convertDtoToJsonString(entityDto),
    //   );
    // } else if (entityDto is AreaEntityDtos) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.areaType.name,
    //     allRemoteCommands: jsonEncode(entityDto.toJson()),
    //   );
    // } else if (entityDto is SceneDtos) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.sceneType.name,
    //     allRemoteCommands: jsonEncode(entityDto.toJson()),
    //   );
    // } else if (entityDto is RoutineCbjDtos) {
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.routineType.name,
    //     allRemoteCommands: jsonEncode(entityDto.toJson()),
    //   );
    // } else {
    //   icLogger.w('Not sure what type to send');
    //   return RequestsAndStatusFromHub(
    //     sendingType: SendingType.undefinedType.name,
    //     allRemoteCommands: '',
    //   );
    // }
    return entityDto;
  }

  Future handleClientStatusRequests(
    ClientStatusRequests clientStatusRequests,
  ) async {
    try {
      logger.i('Got From App');
      final SendingType sendingType =
          SendingTypeExtension.fromString(clientStatusRequests.sendingType);

      switch (sendingType) {
        case SendingType.routineType:
          final Map<String, dynamic> jsonRoutineFromJsonString =
              jsonDecode(clientStatusRequests.allRemoteCommands)
                  as Map<String, dynamic>;

          return RoutineCbjDtos.fromJson(jsonRoutineFromJsonString);

        case SendingType.vendorLoginType:
          final VendorLoginEntityDtos dtoEntity =
              VendorLoginEntityDtos.fromJson(
            jsonDecode(clientStatusRequests.allRemoteCommands)
                as Map<String, dynamic>,
          );
          return IcSynchronizer().loginVendor(dtoEntity.toDomain());
        case SendingType.firstConnection:
          HubRequestsToApp.stream.sink.add(
            RequestsAndStatusFromHub(
              sendingType: SendingType.firstConnection.name,
            ),
          );

          IHubServerController.instance.sendAllAreasFromHubRequestsStream();
          IHubServerController.instance.sendAllEntitiesFromHubRequestsStream();
          IHubServerController.instance.sendAllScenesFromHubRequestsStream();
          return;
        case SendingType.allEntities:
          return IHubServerController.instance.sendAllEntities();
        case SendingType.allAreas:
          return IHubServerController.instance.sendAllAreas();
        case SendingType.allScenes:
          return IHubServerController.instance.sendAllScenes();
        case SendingType.setEntitiesAction:
          final RequestActionObject action =
              RequestActionObjectDtos.fromJsonString(
            clientStatusRequests.allRemoteCommands,
          ).toDomain();
          IcSynchronizer().setEntitiesState(action);
          return;
        case SendingType.getAllSupportedVendors:
          return IHubServerController.instance.sendAllVendors();
        case SendingType.areaType:
          final AreaEntityDtos area = AreaEntityDtos.fromJson(
            jsonDecode(clientStatusRequests.allRemoteCommands)
                as Map<String, dynamic>,
          );
          IcSynchronizer().setNewArea(area.toDomain());
          return;
        case SendingType.setEntitiesForArea:
          final Map<String, dynamic> decoded =
              jsonDecode(clientStatusRequests.allRemoteCommands)
                  as Map<String, dynamic>;
          final String areaId = decoded["areaId"] as String;
          final HashSet<String> entities =
              HashSet<String>.from(decoded["entities"] as List);

          IcSynchronizer().setEtitiesToArea(areaId, entities);
          return;
        case SendingType.remotePipesInformation:
        // final Map<String, dynamic> jsonDecoded =
        //     jsonDecode(clientStatusRequests.allRemoteCommands)
        //         as Map<String, dynamic>;

        // return RemotePipesDtos.fromJson(jsonDecoded);
        case SendingType.getHubEntityInfo:
        case SendingType.responseHubEntityInfo:
        case SendingType.location:
        case SendingType.undefined:
        case SendingType.stringType:
        case SendingType.partialEntityType:
        case SendingType.entityType:
        //  return DeviceHelper.convertJsonStringToDto(
        //       clientStatusRequests.allRemoteCommands,
        //     );
        case SendingType.mqttMassageType:
        case SendingType.sceneType:
        // final Map<String, dynamic> jsonSceneFromJsonString =
        //     jsonDecode(clientStatusRequests.allRemoteCommands)
        //         as Map<String, dynamic>;

        // return SceneDtos.fromJson(jsonSceneFromJsonString);
        case SendingType.scheduleType:
        case SendingType.bindingsType:
      }

      logger.w(
        'Request from app does not support this sending device type ${sendingType.name}',
      );
    } catch (e) {
      logger.e('Error while handling app request: $e');
    }
  }
}
