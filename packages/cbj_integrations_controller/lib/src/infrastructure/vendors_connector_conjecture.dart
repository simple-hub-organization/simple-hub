import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/vendor_entity_information.dart';
import 'package:cbj_integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/cbj_devices/cbj_devices_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/google/google_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/hp/hp_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/sensibo/sensibo_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/shelly/shelly_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/switcher/switcher_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/unseported_vendor_or_device/unseported_vendor_or_device_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/yeelight/yeelight_connector_conjecture.dart';
import 'package:cbj_integrations_controller/src/infrastructure/entities_service.dart';

class VendorsConnectorConjecture {
  factory VendorsConnectorConjecture() => _instance;

  VendorsConnectorConjecture._singletonConstructor() {
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

  static final VendorsConnectorConjecture _instance =
      VendorsConnectorConjecture._singletonConstructor();

  HashMap<String, VendorsAndServices> entitiesToVendor = HashMap();

  List<VendorEntityInformation> getVendors() =>
      VendorConnectorConjectureService.instanceMapByType.values
          .map((e) => e.vendorEntityInformation)
          .toList();
  void loginVendor(VendorLoginEntity vendorLoginService) =>
      VendorConnectorConjectureService
          .instanceMapByType[vendorLoginService.vendor]
          ?.login(vendorLoginService);

  /// Getting ActiveHost that contain MdnsInfo property and activate it inside
  /// The correct company.
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

  Future setHostNameDeviceByCompany(GenericUnsupportedDE entity) async {
    final String? deviceHostNameLowerCase =
        entity.deviceHostName.getOrCrash()?.toLowerCase();
    if (deviceHostNameLowerCase == null || deviceHostNameLowerCase.isEmpty) {
      return;
    }

    VendorConnectorConjectureService? companyConnectorConjecture;

    for (final MapEntry<VendorsAndServices,
            VendorConnectorConjectureService> vendorAndInstance
        in VendorConnectorConjectureService.instanceMapByType.entries) {
      for (final String adeviceHostNameLowerCase
          in vendorAndInstance.value.deviceHostNameLowerCaseList) {
        if (deviceHostNameLowerCase.contains(adeviceHostNameLowerCase)) {
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

  Future foundEntityOfVendor({
    required VendorConnectorConjectureService vendorConnectorConjectureService,
    required DeviceEntityBase entity,
    required String entityCbjUniqueId,
  }) async {
    HashMap<String, DeviceEntityBase>? handeldEntities =
        await vendorConnectorConjectureService.foundEntity(
      entity,
    );

    if (handeldEntities == null) {
      icLogger.i('Found unseported device $entityCbjUniqueId');
      handeldEntities = handeldEntities =
          await UnseportedVendorOrDeviceConnectorConjecture().foundEntity(
        entity
          ..entityCbjUniqueId =
              CoreUniqueId.fromUniqueString(entityCbjUniqueId),
      );
    }

    if (handeldEntities == null || handeldEntities.isEmpty) {
      return;
    }
    for (final MapEntry<String, DeviceEntityBase> entity
        in handeldEntities.entries) {
      entitiesToVendor.addEntries([
        MapEntry(entity.key, entity.value.cbjDeviceVendor.vendorsAndServices),
      ]);
    }

    EntitiesService().addDiscovedEntity(handeldEntities);
  }

  HashMap<VendorsAndServices, List<int>>? portsToScen() {
    return VendorConnectorConjectureService.portsUsedByVendor;
  }

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

  HashMap<String, DeviceEntityBase> getEntities() =>
      VendorConnectorConjectureService.instanceMapByType.values.fold(
        HashMap<String, DeviceEntityBase>(),
        (previousValue, element) =>
            previousValue..addAll(element.vendorEntities),
      );

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
