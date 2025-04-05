import 'dart:async';
import 'dart:collection';

import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/cbj_devices/cbj_devices_helpers.dart';
import 'package:integrations_controller/src/infrastructure/devices/cbj_devices/cbj_smart_device/cbj_smart_device_entity.dart';
import 'package:integrations_controller/src/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';

class CbjDevicesConnectorConjecture extends VendorConnectorConjectureService {
  factory CbjDevicesConnectorConjecture() => _instance;

  CbjDevicesConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.cbjDeviceSmartEntity,
          displayName: 'CBJ',
          imageUrl:
              'https://github.com/CyBear-Jinni/CBJ_Site/blob/master/assets/images/cbj_app_icon_no_bg.png?raw=true',
          ports: [50054],
        );

  static final CbjDevicesConnectorConjecture _instance =
      CbjDevicesConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>?> foundEntity(
    DeviceEntityBase entity,
  ) async {
    final String? hostName = entity.deviceHostName.getOrCrash();
    if (hostName == null) {
      return null;
    }
    for (final DeviceEntityBase savedDevice in vendorEntities.values) {
      if ((savedDevice is CbjSmartComputerEntity) &&
          hostName == savedDevice.entityUniqueId.getOrCrash()) {
        return null;
      } else if (hostName == savedDevice.entityUniqueId.getOrCrash()) {
        icLogger.w(
          'Cbj device type supported but implementation is missing here',
        );
      }
    }

    final List<CbjSmartDeviceInfo?> componentsInDevice =
        await getAllComponentsOfDevice(entity);
    final String address = entity.deviceLastKnownIp.getOrCrash()!;
    final List<DeviceEntityBase> devicesList =
        CbjDevicesHelpers.addDiscoveredDevice(
      componentsInDevice: componentsInDevice,
      deviceAddress: address,
    );
    if (devicesList.isEmpty) {
      return null;
    }

    final HashMap<String, DeviceEntityBase> addedDevice = HashMap();

    for (final DeviceEntityBase entityAsDevice in devicesList) {
      final MapEntry<String, DeviceEntityBase> deviceAsEntry = MapEntry(
        entityAsDevice.entityCbjUniqueId.getOrCrash(),
        entityAsDevice,
      );

      addedDevice.addEntries([deviceAsEntry]);
      vendorEntities.addEntries([deviceAsEntry]);

      icLogger.t(
        'New Cbj Smart Device name:${entityAsDevice.cbjEntityName.getOrCrash()}',
      );
    }
    return addedDevice;
  }

  Future<List<CbjSmartDeviceInfo?>> getAllComponentsOfDevice(
    DeviceEntityBase entity,
  ) async {
    final List<CbjSmartDeviceInfo?> devicesInfo =
        await CbjSmartDeviceClient.getCbjSmartDeviceHostDevicesInfo(entity);
    return devicesInfo;
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async =>
      HashMap();
}
