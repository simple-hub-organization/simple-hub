import 'dart:async';
import 'dart:collection';

import 'package:integrations_controller/src/domain/controllers/controllers.dart';
import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/vendor_entity_information.dart';
import 'package:integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/cbj_devices/cbj_devices_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/google/google_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/hp/hp_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/sensibo/sensibo_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/shelly/shelly_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/switcher/switcher_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/unseported_vendor_or_device/unseported_vendor_or_device_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:integrations_controller/src/infrastructure/entities_service.dart';

class VendorsConnectorConjecture extends VendorConnectorConjectureController {
  @override
  Future asyncConstructor() async {
    UnseportedVendorOrDeviceConnectorConjecture();
    YeelightConnectorConjecture();
    TasmotaIpConnectorConjecture();
    SwitcherConnectorConjecture();
    ShellyConnectorConjecture();
    PhilipsHueConnectorConjecture();
    LifxConnectorConjecture();
    HpConnectorConjecture();
    GoogleConnectorConjecture();
    CbjDevicesConnectorConjecture();
    SensiboConnectorConjecture();
  }

  HashMap<String, VendorsAndServices> entitiesToVendor = HashMap();

  @override
  List<VendorEntityInformation> getVendors() =>
      VendorConnectorConjectureService.instanceMapByType.values
          .map((e) => e.vendorEntityInformation)
          .toList();
  @override
  void loginVendor(VendorLoginEntity vendorLoginService) =>
      VendorConnectorConjectureService
          .instanceMapByType[vendorLoginService.vendor]
          ?.login(vendorLoginService);

  // When vendor need more information from entity it using this list
  @override
  List<DeviceEntityBase> moreInformationForEntity = [];

  /// Getting ActiveHost that contain MdnsInfo property and activate it inside
  /// The correct company.
  @override
  Future setMdnsDevice(GenericUnsupportedDE entity) async {
    final String? mdnsDeviceIp = entity.deviceLastKnownIp.getOrCrash();
    final String? mdnsName = entity.deviceMdns.getOrCrash();

    if (mdnsDeviceIp == null || mdnsName == null) {
      return;
    }
    final String startOfMdnsName = mdnsName.substring(0, mdnsName.indexOf('.'));
    // final String startOfMdnsNameLower = startOfMdnsName.toLowerCase();

    String? serviceType;

    final List<String>? ptrNameSplit =
        entity.ptrResourceRecord.getOrCrash()?.split('.');
    String tempString = '';
    if (ptrNameSplit != null) {
      if (ptrNameSplit.isNotEmpty) {
        tempString = ptrNameSplit[0];
      }
      if (ptrNameSplit.length >= 2) {
        tempString = '$tempString.${ptrNameSplit[1]}';
      }
      if (tempString.isNotEmpty) {
        serviceType = tempString;
      }
    }

    if (serviceType == null || serviceType.isEmpty) {
      return;
    }

    VendorConnectorConjectureService? companyConnectorConjecture;

    for (final VendorConnectorConjectureService connectorConjecture
        in VendorConnectorConjectureService.instanceMapByType.values) {
      final bool containUniqueType =
          connectorConjecture.uniqeMdnsList.contains(serviceType);

      if (containUniqueType) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }

      final bool containServiceType =
          connectorConjecture.mdnsList.contains(serviceType);
      if (!containServiceType) {
        continue;
      }

      bool containStartOfMdns =
          connectorConjecture.uniqueIdentifierNameInMdns.isEmpty;

      if (containStartOfMdns) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }

      for (final String uniqueNameInMdns
          in connectorConjecture.uniqueIdentifierNameInMdns) {
        if (startOfMdnsName.startsWith(uniqueNameInMdns)) {
          containStartOfMdns = true;
          break;
        }
      }

      if (containStartOfMdns) {
        companyConnectorConjecture = connectorConjecture;
        break;
      }
    }
    if (companyConnectorConjecture == null) {
      return;
    }

    foundEntityOfVendor(
      vendorConnectorConjectureService: companyConnectorConjecture,
      entity: entity,
      entityCbjUniqueId: mdnsName,
    );
  }

  @override
  void setUpnpDevice(GenericUnsupportedDE entity) {
    final String? friendlyName =
        entity.deviceOriginalName.getOrCrash()?.toLowerCase();
    final String? manufacturer =
        entity.deviceVendor.getOrCrash()?.toLowerCase();
    VendorConnectorConjectureService? vendorConjecture;

    for (final VendorConnectorConjectureService connectorConjecture
        in VendorConnectorConjectureService.instanceMapByType.values) {
      for (final String upnpName
          in connectorConjecture.deviceUpnpNameLowerCaseList) {
        if ((friendlyName?.contains(upnpName) ?? false) ||
            (manufacturer?.contains(upnpName) ?? false)) {
          vendorConjecture = connectorConjecture;
          break;
        }
      }
      if (vendorConjecture != null) {
        break;
      }
    }
    if (vendorConjecture == null) {
      icLogger.w(
        'No Vendor Connector Conjecture for pnp $friendlyName $manufacturer',
      );
      return;
    }
    foundEntityOfVendor(
      entity: entity,
      vendorConnectorConjectureService: vendorConjecture,
      entityCbjUniqueId: entity.getCbjEntityId,
    );
  }

  @override
  Future setHostNameDeviceByCompany(GenericUnsupportedDE entity) async {
    // For existing entities that require more data from the scan
    for (final DeviceEntityBase requestEntity in moreInformationForEntity) {
      if (entity.deviceLastKnownIp.getOrCrash() ==
          requestEntity.deviceLastKnownIp.getOrCrash()) {
        sendMoreInformationForRequestedDevice(
          entity: entity,
          vendor: requestEntity.cbjDeviceVendor.vendorsAndServices,
          entityUniqueId: requestEntity.entityCbjUniqueId,
        );
        return;
      }
    }

    final String? deviceHostNameLowerCase =
        entity.deviceHostName.getOrCrash()?.toLowerCase();
    if (deviceHostNameLowerCase == null || deviceHostNameLowerCase.isEmpty) {
      return;
    }

    VendorConnectorConjectureService? companyConnectorConjecture;

    for (final MapEntry<VendorsAndServices,
            VendorConnectorConjectureService> vendorAndInstance
        in VendorConnectorConjectureService.instanceMapByType.entries) {
      for (final String deviceHostNameLowerCase
          in vendorAndInstance.value.deviceHostNameLowerCaseList) {
        if (deviceHostNameLowerCase.contains(deviceHostNameLowerCase)) {
          companyConnectorConjecture = vendorAndInstance.value;
          break;
        }
      }
      if (companyConnectorConjecture != null) {
        break;
      }
    }

    if (companyConnectorConjecture == null) {
      return;
    }

    foundEntityOfVendor(
      vendorConnectorConjectureService: companyConnectorConjecture,
      entity: entity,
      entityCbjUniqueId: deviceHostNameLowerCase,
    );
  }

  Future sendMoreInformationForRequestedDevice({
    required DeviceEntityBase entity,
    required VendorsAndServices vendor,
    required CoreUniqueId entityUniqueId,
  }) async {
    entity.entityCbjUniqueId = entityUniqueId;
    entity.cbjDeviceVendor = CbjDeviceVendor(vendor);
    final VendorConnectorConjectureService? vendorConnectorConjectureService =
        getVendorConnectorConjecture(vendor);
    if (vendorConnectorConjectureService == null) {
      return;
    }
    vendorConnectorConjectureService.addMoreInformationOnEntity(entity);
  }

  @override
  Future setHostNameDeviceByPort(
    VendorsAndServices vendor,
    DeviceEntityBase entity,
  ) async {
    final VendorConnectorConjectureService? vendorConnectorConjectureService =
        getVendorConnectorConjecture(vendor);
    final String? port = entity.devicePort.getOrCrash();
    if (vendorConnectorConjectureService == null || port == null) {
      return;
    }

    foundEntityOfVendor(
      vendorConnectorConjectureService: vendorConnectorConjectureService,
      entity: entity,
      entityCbjUniqueId: port,
    );
  }

  @override
  Future loadEntitiesFromDb({
    required VendorConnectorConjectureService vendorConnectorConjectureService,
    required DeviceEntityBase entity,
    required String entityCbjUniqueId,
  }) async {
    final HashMap<String, DeviceEntityBase>? handeldEntities =
        await vendorConnectorConjectureService.loadFromDb(
      entity,
    );

    if (handeldEntities == null || handeldEntities.isEmpty) {
      return;
    }
    for (final MapEntry<String, DeviceEntityBase> entity
        in handeldEntities.entries) {
      entitiesToVendor.addEntries([
        MapEntry(entity.key, entity.value.cbjDeviceVendor.vendorsAndServices),
      ]);
    }
  }

  @override
  Future foundEntityOfVendor({
    required VendorConnectorConjectureService vendorConnectorConjectureService,
    required DeviceEntityBase entity,
    required String entityCbjUniqueId,
  }) async {
    HashMap<String, DeviceEntityBase>? handledEntity =
        await vendorConnectorConjectureService.foundEntity(
      entity,
    );

    if (handledEntity == null) {
      icLogger.i('Found unsupported device $entityCbjUniqueId');
      handledEntity = handledEntity =
          await UnseportedVendorOrDeviceConnectorConjecture().foundEntity(
        entity
          ..entityCbjUniqueId =
              CoreUniqueId.fromUniqueString(entityCbjUniqueId),
      );
    }

    if (handledEntity == null || handledEntity.isEmpty) {
      return;
    }
    for (final MapEntry<String, DeviceEntityBase> entity
        in handledEntity.entries) {
      entitiesToVendor.addEntries([
        MapEntry(entity.key, entity.value.cbjDeviceVendor.vendorsAndServices),
      ]);
    }

    EntitiesService().addDiscoveredEntity(handledEntity);
  }

  @override
  HashMap<VendorsAndServices, List<int>>? portsToScan() {
    return VendorConnectorConjectureService.portsUsedByVendor;
  }

  @override
  VendorConnectorConjectureService? getVendorConnectorConjecture(
    VendorsAndServices vendor,
  ) {
    final VendorConnectorConjectureService? vendorInstance =
        VendorConnectorConjectureService.instanceMapByType[vendor];
    if (vendorInstance != null) {
      return vendorInstance;
    }

    icLogger.w(
      'Please add vendor to support string ${vendor.name} to connector conjecture',
    );
    return null;
  }

  @override
  void setEntitiesState(RequestActionObject action) {
    for (final String entityId in action.entityIds) {
      final VendorsAndServices? vendor = entitiesToVendor[entityId];
      if (vendor == null) {
        continue;
      }
      getVendorConnectorConjecture(vendor)?.setEntityState(
        ids: HashSet.from([entityId]),
        request: EntitySingleRequest(
          action: action.actionType,
          property: action.property,
          values: action.value,
        ),
      );
    }
  }

  @override
  HashMap<String, DeviceEntityBase> getEntities() =>
      VendorConnectorConjectureService.instanceMapByType.values.fold(
        HashMap<String, DeviceEntityBase>(),
        (previousValue, element) =>
            previousValue..addAll(element.vendorEntities),
      );

  @override
  HashMap<String, EntityTypes> getTypesForEntities(HashSet<String> entities) =>
      entities
          .map(
            (e) => MapEntry(
              e,
              getVendorConnectorConjecture(entitiesToVendor[e]!)!
                  .vendorEntities[e]!
                  .entityTypes
                  .type,
            ),
          )
          .fold(
            HashMap<String, EntityTypes>(),
            (previousValue, element) => previousValue..addEntries([element]),
          );
}
