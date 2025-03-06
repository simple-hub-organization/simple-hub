import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_integrations_controller/src/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/src/domain/routine/routine_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/infrastructure/colors.dart';
import 'package:cbj_integrations_controller/src/infrastructure/node_red/node_red_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

part 'package:cbj_integrations_controller/src/infrastructure/routines/routine_repository.dart';

@Deprecated('New architecture. Moved to AutomationService')
abstract class IRoutineCbjRepository {
  static IRoutineCbjRepository? _instance;

  static IRoutineCbjRepository get instance {
    return _instance ??= _RoutineCbjRepository();
  }

  Future<Set<RoutineCbjEntity>> getAllRoutinesAsList();

  Future<Map<String, RoutineCbjEntity>> getAllRoutinesAsMap();

  /// Sending the new routine to the hub to get added, will not save it to local db
  Future<Either<RoutineCbjFailure, Unit>> addNewRoutine(
    RoutineCbjEntity routineCbj,
  );

  Future<bool> activateRoutine(RoutineCbjEntity routineCbj);

  /// Get entity and return the full MQTT path to it
  Future<String> getFullMqttPathOfRoutine(RoutineCbjEntity routineCbj);

  Stream<Either<RoutineCbjFailure, Set<RoutineCbjEntity>>> watchAllRoutines();

  /// Sending the new routine to the hub to get added
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>>
      addOrUpdateNewRoutineInHub(
    RoutineCbjEntity routineCbjEntity,
  );

  /// Activate action of all routine list
  Future<Either<RoutineCbjFailure, Unit>> activateRoutines(
    Set<RoutineCbjEntity> routinesList,
  );

  Future<Either<RoutineCbjFailure, RoutineCbjEntity>> getRoutine();

  /// Sending the new routine to the hub to get added
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>>
      addOrUpdateNewRoutineInHubFromDevicesPropertyActionList(
    String routineName,
    Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
    RoutineCbjRepeatDateDays daysToRepeat,
    RoutineCbjRepeatDateHour hourToRepeat,
    RoutineCbjRepeatDateMinute minutesToRepeat,
  );

  /// Sending the new routine from the hub to the app routine list
  void addOrUpdateNewRoutineInApp(
    RoutineCbjEntity routineCbj,
  );

  Future initiateHubConnection();

  BehaviorSubject<Set<RoutineCbjEntity>>
      routinesResponseFromTheHubStreamController =
      BehaviorSubject<Set<RoutineCbjEntity>>();
}
