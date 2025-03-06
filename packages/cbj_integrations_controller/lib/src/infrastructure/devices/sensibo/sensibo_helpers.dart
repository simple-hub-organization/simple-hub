import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_ac_entity/generic_ac_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/sensibo/entities/sensibo_sky_entity.dart';
import 'package:sensibo/sensibo.dart';

class SensiboHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    SensiboBase sensibo,
  ) async {
    final String id = sensibo.id;
    final Map<String, dynamic> acState = sensibo.acState;
    final String productModel = sensibo.productModel;
    final String macAddress = sensibo.macAddress;
    final dynamic powerConsumption = sensibo.powerConsumption;
    final String name = sensibo.room['name'] as String;

    final HashMap<String, DeviceEntityBase> convertedEntites = HashMap();

    switch (sensibo.type) {
      case SensiboProductModels.skyv2:
        if (sensibo is! SensiboSky) {
          return HashMap();
        }
        final SensiboSkyEntity googleDE = SensiboSkyEntity(
          uniqueId: CoreUniqueId.fromUniqueString(id),
          entityUniqueId: EntityUniqueId(id),
          cbjEntityName: CbjEntityName(value: name),
          entityOriginalName: EntityOriginalName(name),
          deviceOriginalName: DeviceOriginalName(value: name),
          entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
          senderDeviceOs: DeviceSenderDeviceOs(''),
          senderDeviceModel: DeviceSenderDeviceModel(productModel),
          stateMassage: DeviceStateMassage(value: ''),
          senderId: DeviceSenderId(),
          deviceVendor: DeviceVendor(),
          deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
          deviceUniqueId: DeviceUniqueId(id),
          devicePort: DevicePort(),
          deviceLastKnownIp: DeviceLastKnownIp(),
          deviceHostName: DeviceHostName(),
          deviceMdns: DeviceMdns(),
          srvResourceRecord: DeviceSrvResourceRecord(),
          mdnsServiceType: DeviceMdnsServiceType(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          srvTarget: DeviceSrvTarget(),
          compUuid: DeviceCompUuid(''),
          powerConsumption: DevicePowerConsumption(powerConsumption.toString()),
          devicesMacAddress: DevicesMacAddress(value: macAddress),
          entityKey: EntityKey(''),
          requestTimeStamp: RequestTimeStamp(''),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(id),
          acSwitchState: GenericAcSwitchState(
            (acState['on'] as bool) ? EntityActions.on : EntityActions.off,
          ),
          mode: GenericAcMode(acState['mode'].toString()),
          fanLevel: GenericAcFanLevel(acState['fanLevel'].toString()),
          light: GenericAcLight(acState['light'].toString()),
        );
        convertedEntites.addEntries([
          MapEntry(googleDE.entityCbjUniqueId.getOrCrash(), googleDE),
        ]);
      case SensiboProductModels.elements:
        break;
    }

    return convertedEntites;
  }
}
