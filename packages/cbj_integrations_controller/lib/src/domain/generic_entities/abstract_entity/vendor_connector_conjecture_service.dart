import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/vendor_entity_information.dart';
import 'package:cbj_integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:meta/meta.dart';

abstract class VendorConnectorConjectureService {
  VendorConnectorConjectureService(
    this.vendorsAndServices, {
    required String displayName,
    required String imageUrl,
    VendorLoginTypes loginType = VendorLoginTypes.notNeeded,
    String? urlToLoginCredentials,
    this.ports = const [],
    this.uniqeMdnsList = const [],
    this.mdnsList = const [],
    this.uniqueIdentifierNameInMdns = const [],
    this.deviceHostNameLowerCaseList = const [],
  }) {
    vendorEntityInformation = VendorEntityInformation(
      vendorsAndServices,
      loginType: loginType,
      displayName: displayName,
      imageUrl: imageUrl,
      urlToLoginCredentials: urlToLoginCredentials,
    );
    instanceMapByType.addEntries([MapEntry(vendorsAndServices, this)]);
    addToPortByVendor(vendorsAndServices, ports);
  }

  static HashMap<VendorsAndServices, VendorConnectorConjectureService>
      instanceMapByType = HashMap();

  static final HashMap<VendorsAndServices, List<int>> _portsUsedByVendor =
      HashMap();

  static HashMap<VendorsAndServices, List<int>> get portsUsedByVendor =>
      _portsUsedByVendor;

  static void addToPortByVendor(
    VendorsAndServices vendorsAndServices,
    List<int> ports,
  ) {
    if (ports.isEmpty) {
      return;
    }
    _portsUsedByVendor.addEntries([MapEntry(vendorsAndServices, ports)]);
  }

  @nonVirtual
  final VendorsAndServices vendorsAndServices;

  @nonVirtual
  HashSet<String> notFullyLoadedEntities = HashSet();

  @nonVirtual
  Future<HashMap<String, DeviceEntityBase>?> loadFromDb(
    DeviceEntityBase entity,
  ) async {
    entity.entityStateGRPC = EntityState(EntityStateGRPC.loadingFromDb);

    final HashMap<String, DeviceEntityBase> mapEntities =
        HashMap.fromEntries([MapEntry(entity.getCbjEntityId, entity)]);
    vendorEntities.addAll(mapEntities);
    newEntityToVendorDevice(entity, fromDb: true)
        .then((HashMap<String, DeviceEntityBase> entities) {
      vendorEntities.addAll(entities);
    });

    return mapEntities;
  }

  final List<int> ports;

  late final VendorEntityInformation vendorEntityInformation;
  final List<String> deviceHostNameLowerCaseList;

  // String? _userName;
  // String? _password;
  // String? _authToken;
  String? apiKey;

  /// Stores all devices for the each vendor, devices will be stored as the
  /// vendor implementation and not as generic devices
  ///
  /// key is entityUniqueId so that it can both use it quickly to not add the
  /// same device twice and to manage requests of actions from the app since
  /// the action already arrives with entityUniqueId value
  HashMap<String, DeviceEntityBase> vendorEntities = HashMap();

  /// Exists only for the vendor devices
  @nonVirtual
  final List<String> uniqeMdnsList;

  /// Can be found on more then one vendor
  @nonVirtual
  final List<String> mdnsList;

  @nonVirtual
  final List<String> uniqueIdentifierNameInMdns;

  Future<HashMap<String, DeviceEntityBase>?> foundEntity(
    DeviceEntityBase entity,
  ) async {
    final HashMap<String, DeviceEntityBase> vendorEntityMap =
        await newEntityToVendorDevice(
      entity,
    );
    if (vendorEntityMap.isEmpty) {
      return null;
    }
    final int length = vendorEntityMap.length;
    vendorEntityMap
        .removeWhere((key, value) => vendorEntities.containsKey(key));

    if (vendorEntityMap.isEmpty && length <= 1) {
      return HashMap();
    }

    icLogger.i('New $vendorsAndServices entities got added');

    vendorEntities.addAll(vendorEntityMap);

    return vendorEntityMap;
  }

  /// Converting new entity that got found into its vendor type
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  });

  Future setEntityState({
    required HashSet<String> ids,
    required EntitySingleRequest request,
  }) async {
    for (final String id in ids) {
      final DeviceEntityBase? entity = vendorEntities[id];
      if (entity == null) {
        icLogger.e(
          "$vendorsAndServices can't find the device to set cbjUniqeId: $id",
        );
        continue;
      }
      entity.executeAction(request);
    }
  }

  void loginApiKey(String value) {}
  void loginAuthToken(String value) {}
  void loginEmailAndPassword(String email, String password) {}
  void addDevice(VendorLoginEntity loginEntity) {}

  void login(VendorLoginEntity vendorLoginService) {
    switch (vendorEntityInformation.loginType) {
      case VendorLoginTypes.notNeeded:
        break;
      case VendorLoginTypes.authToken:
        if (vendorLoginService.authToken == null) {
          return;
        }
        loginAuthToken(vendorLoginService.apiKey!);
      case VendorLoginTypes.apiKey:
        if (vendorLoginService.apiKey == null) {
          return;
        }
        loginApiKey(vendorLoginService.apiKey!);
      case VendorLoginTypes.emailAndPassword:
        if (vendorLoginService.email == null ||
            vendorLoginService.password == null) {
          return;
        }
        loginEmailAndPassword(
          vendorLoginService.email!,
          vendorLoginService.password!,
        );
      case VendorLoginTypes.addDeviceByPairingCode:
        if (vendorLoginService.pairingCode == null) {
          return;
        }
        addDevice(vendorLoginService);
    }
  }
}
