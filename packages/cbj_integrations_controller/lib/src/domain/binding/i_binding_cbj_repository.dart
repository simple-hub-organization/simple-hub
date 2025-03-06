import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/domain/binding/value_objects_routine_cbj.dart';
import 'package:cbj_integrations_controller/src/infrastructure/colors.dart';
import 'package:cbj_integrations_controller/src/infrastructure/node_red/node_red_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

part 'package:cbj_integrations_controller/src/infrastructure/bindings/binding_repository.dart';

@Deprecated('New architecture. Moved to AutomationService')
abstract class IBindingCbjRepository {
  static IBindingCbjRepository? _instance;

  static IBindingCbjRepository get instance {
    return _instance ??= _BindingCbjRepository();
  }

  Future<Set<BindingCbjEntity>> getAllBindingsAsList();

  Future<Map<String, BindingCbjEntity>> getAllBindingsAsMap();

  Stream<Either<BindingCbjFailure, Set<BindingCbjEntity>>> watchAllBindings();

  /// Sending the new binding to the hub to get added
  Future<Either<BindingCbjFailure, BindingCbjEntity>>
      addOrUpdateNewBindingInHub(
    BindingCbjEntity bindingCbjEntity,
  );

  /// Activate action of all binding list
  Future<Either<BindingCbjFailure, Unit>> activateBindings(
    Set<BindingCbjEntity> bindingsList,
  );

  /// Sending the new binding to the hub to get added
  Future<Either<BindingCbjFailure, Unit>> addNewBinding(
    BindingCbjEntity bindingCbj,
  );

  Future<bool> activateBinding(
    BindingCbjEntity bindingCbj,
  );

  /// Get entity and return the full MQTT path to it
  Future<String> getFullMqttPathOfBinding(BindingCbjEntity bindingCbj);

  Future<Either<BindingCbjFailure, BindingCbjEntity>> getBinding();

  /// Sending the new binding to the hub to get added
  Future<Either<BindingCbjFailure, BindingCbjEntity>>
      addOrUpdateNewBindingInHubFromDevicesPropertyActionList(
    String bindingName,
    Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
  );

  /// Sending the new binding from the hub to the app binding list
  void addOrUpdateNewBindingInApp(
    BindingCbjEntity bindingCbj,
  );

  Future initiateHubConnection();

  BehaviorSubject<Set<BindingCbjEntity>>
      bindingsResponseFromTheHubStreamController =
      BehaviorSubject<Set<BindingCbjEntity>>();
}
