import 'dart:async';
import 'dart:collection';

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
    logger.i('Found a sony device');
    if (entity.entityStateGRPC.state !=
        EntityStateGRPC.addNewEntityFromJavascriptHub) {
      return HashMap();
    }
    return SonyHelpers.addDiscoveredDevice(entity);
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
