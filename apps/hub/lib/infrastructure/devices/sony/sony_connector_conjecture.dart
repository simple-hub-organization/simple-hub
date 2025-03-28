import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:hub/infrastructure/devices/sony/sony_helpers.dart';
import 'package:hub/infrastructure/web_socket/hub_javascript_web_socket.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';

class SonyConnectorConjecture extends VendorConnectorConjectureService {
  factory SonyConnectorConjecture() => _instance;

  SonyConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.sony,
          displayName: 'Sony',
          imageUrl:
              'https://static-eu-data.manualslib.com/brand/695/45/sony-logo.png',
          uniqeMdnsList: ['_sony._tcp', '_sonyc._udp'],
          uniqueIdentifierNameInMdns: ['sony'],
          deviceUpnpNameLowerCaseList: ['sony', 'bravia'],
          loginType: VendorLoginTypes.ipPairingCodePort,
        );

  static final SonyConnectorConjecture _instance =
      SonyConnectorConjecture._singletonContractor();

  @override
  void addDevice(VendorLoginEntity loginEntity) =>
      HubJavascriptWebSocket.instance.addDevice(loginEntity);

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async {
    if (entity.entityStateGRPC.state ==
        EntityStateGRPC.addNewEntityFromJavascriptHub) {
      final DeviceEntityBase? savedEntity =
          vendorEntities[entity.deviceUniqueId.getOrCrash()];
      if (savedEntity != null) {
        // Adding some fields from UPnP search and removing incomplete object so that it will get re added
        entity.cbjEntityName = savedEntity.cbjEntityName;
        vendorEntities.remove(entity.deviceUniqueId.getOrCrash());
      }
      return SonyHelpers.addDiscoveredDevice(entity);
    }

    if (vendorEntities[entity.entityCbjUniqueId.getOrCrash()] != null ||
        vendorEntities.entries.firstWhereOrNull(
              (t) =>
                  t.value.deviceUniqueId.getOrCrash() ==
                  entity.deviceUniqueId.getOrCrash(),
            ) !=
            null) {
      return HashMap();
    }

    logger.i('Found a sony device');
    // Adding empty device until real connection establish
    vendorEntities
        .addEntries([MapEntry(entity.deviceUniqueId.getOrCrash(), entity)]);

    // Send device to javascript hub for connection
    addDevice(
      VendorLoginEntity(
        VendorsAndServices.sony,
        ip: entity.deviceLastKnownIp.getOrCrash(),
        deviceUniqueId: entity.deviceUniqueId.getOrCrash(),
      ),
    );

    return HashMap();
  }

  @override
  Future<void> addMoreInformationOnEntity(DeviceEntityBase entity) async {
    final DeviceEntityBase? entityToChange =
        vendorEntities[entity.entityCbjUniqueId.getOrCrash()];

    entityToChange?.devicesMacAddress = entity.devicesMacAddress;

    VendorsConnectorConjecture().moreInformationForEntity.removeWhere((entity) {
      if (entity.entityCbjUniqueId.getOrCrash() ==
          entityToChange?.entityCbjUniqueId.getOrCrash()) {
        return true;
      }
      return false;
    });
  }
}
