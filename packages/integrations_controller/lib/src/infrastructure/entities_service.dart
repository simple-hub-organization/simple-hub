import 'dart:collection';
import 'dart:convert';

import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:integrations_controller/src/domain/i_local_db_repository.dart';
import 'package:integrations_controller/src/domain/ic_synchronizer.dart';
import 'package:integrations_controller/src/domain/networks_manager.dart';
import 'package:integrations_controller/src/infrastructure/devices/device_helper/device_helper.dart';
import 'package:integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';

class EntitiesService {
  factory EntitiesService() => _instance;

  EntitiesService._singletonConstractor();

  static final EntitiesService _instance =
      EntitiesService._singletonConstractor();

  void addDiscovedEntity(HashMap<String, DeviceEntityBase> entities) {
    // final HashMap<String, DeviceEntityBase> newEntities = HashMap();
    // for (final MapEntry<String, DeviceEntityBase> entiery in entities.entries) {
    //   if (!entitiesMap.containsKey(entiery.key)) {
    //     newEntities.addEntries([entiery]);
    //   } else {
    //     entitiesMap[entiery.key] = entiery.value;
    //   }
    // }
    // if (newEntities.isEmpty) {
    //   return;
    // }

    // entitiesMap.addAll(newEntities);
    saveToDb();
    IcSynchronizer().newEntity(entities);
  }

  void setEntitiesState(RequestActionObject action) =>
      VendorsConnectorConjecture().setEntitiesState(action);

  HashMap<String, DeviceEntityBase> getEntities() =>
      VendorsConnectorConjecture().getEntities();

  void saveToDb() {
    final List<String> entitiesJsonString = [];

    for (final DeviceEntityBase entity in getEntities().values) {
      final String entityAsJsonString =
          jsonEncode(entity.toInfrastructure().toJson());
      entitiesJsonString.add(entityAsJsonString);
    }
    final String homeBoxName = NetworksManager().currentNetwork!.uniqueId;

    IDbRepository.instance.saveEntities(homeBoxName, entitiesJsonString);
  }

  Future loadFromDb(String homeId) async {
    final List<String> entitiesString =
        IDbRepository.instance.getEntities(homeId);
    for (final String entityString in entitiesString) {
      final DeviceEntityBase entity =
          DeviceHelper.convertJsonStringToDomain(entityString);
      final VendorConnectorConjectureService? vendor =
          VendorsConnectorConjecture().getVendorConnectorConjecture(
        entity.cbjDeviceVendor.vendorsAndServices,
      );
      if (vendor == null) {
        return;
      }
      // entitiesMap.addEntries([MapEntry(entity.getCbjEntityId, entity)]);
      VendorsConnectorConjecture().loadEntitiesFromDb(
        vendorConnectorConjectureService: vendor,
        entity: entity,
        entityCbjUniqueId: entity.getCbjEntityId,
      );
    }
  }
}
