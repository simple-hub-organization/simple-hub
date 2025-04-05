part of 'package:integrations_controller/src/domain/routine/i_routine_cbj_repository.dart';

@Deprecated('New architecture. Moved to AutomationService')
class _RoutineCbjRepository implements IRoutineCbjRepository {
  final Map<String, RoutineCbjEntity> _allRoutines = {};

  @override
  Future<Set<RoutineCbjEntity>> getAllRoutinesAsList() async {
    return _allRoutines.values.toSet();
  }

  @override
  Future<Map<String, RoutineCbjEntity>> getAllRoutinesAsMap() async {
    return _allRoutines;
  }

  @override
  Future<Either<RoutineCbjFailure, Unit>> addNewRoutine(
    RoutineCbjEntity routineCbj,
  ) async {
    RoutineCbjEntity tempRoutineCbj = routineCbj;

    /// Check if routine already exist
    if (findRoutineIfAlreadyBeenAdded(tempRoutineCbj) == null) {
      _allRoutines.addEntries(
        [MapEntry(tempRoutineCbj.uniqueId.getOrCrash(), tempRoutineCbj)],
      );

      final String entityId = tempRoutineCbj.uniqueId.getOrCrash();

      /// If it is new routine
      _allRoutines[entityId] = tempRoutineCbj;

      // ISavedAreasRepo.instance
      // .addRoutineToAreaDiscoveredIfNotExist(tempRoutineCbj);

      final String routineNodeRedFlowId =
          await NodeRedRepository().createNewNodeRedRoutine(tempRoutineCbj);
      if (routineNodeRedFlowId.isNotEmpty) {
        tempRoutineCbj = tempRoutineCbj.copyWith(
          nodeRedFlowId: RoutineCbjNodeRedFlowId(routineNodeRedFlowId),
        );
      }
      return left(const RoutineCbjFailure.unableToUpdate());
    }
    return right(unit);
  }

  @override
  Future<bool> activateRoutine(
    RoutineCbjEntity routineCbj,
  ) async {
    final String fullPathOfRoutine = await getFullMqttPathOfRoutine(routineCbj);
    IMqttServerRepository.instance
        .publishMessage(fullPathOfRoutine, DateTime.now().toString());

    return true;
  }

  /// Get entity and return the full MQTT path to it
  @override
  Future<String> getFullMqttPathOfRoutine(RoutineCbjEntity routineCbj) async {
    final String hubBaseTopic =
        IMqttServerRepository.instance.getHubBaseTopic();
    final String routinesTopicTypeName =
        IMqttServerRepository.instance.getRoutinesTopicTypeName();
    final String routineId = routineCbj.firstNodeId.getOrCrash()!;

    return '$hubBaseTopic/$routinesTopicTypeName/$routineId';
  }

  /// Check if all routines does not contain the same routine already
  /// Will compare the unique id's that each company sent us
  RoutineCbjEntity? findRoutineIfAlreadyBeenAdded(
    RoutineCbjEntity routineEntity,
  ) {
    return _allRoutines[routineEntity.uniqueId.getOrCrash()];
  }

  @override
  Future<Either<RoutineCbjFailure, Unit>> activateRoutines(
    Set<RoutineCbjEntity> routinesList,
  ) async {
    for (final RoutineCbjEntity routineCbjEntity in routinesList) {
      addOrUpdateNewRoutineInHub(
        routineCbjEntity.copyWith(
          entityStateGRPC: RoutineCbjDeviceStateGRPC(
            CbjDeviceStateGRPC.waitingInComp.toString(),
          ),
        ),
      );
    }
    return right(unit);
  }

  @override
  void addOrUpdateNewRoutineInApp(RoutineCbjEntity routineCbj) {
    _allRoutines[routineCbj.uniqueId.getOrCrash()] = routineCbj;

    routinesResponseFromTheHubStreamController.sink
        .add(_allRoutines.values.toSet());
  }

  @override
  Future initiateHubConnection() async {}

  @override
  Stream<Either<RoutineCbjFailure, Set<RoutineCbjEntity>>>
      watchAllRoutines() async* {
    yield* routinesResponseFromTheHubStreamController.stream
        .map((event) => right(event));
  }

  @override
  BehaviorSubject<Set<RoutineCbjEntity>>
      routinesResponseFromTheHubStreamController =
      BehaviorSubject<Set<RoutineCbjEntity>>();

  @override
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>>
      addOrUpdateNewRoutineInHub(
    RoutineCbjEntity routineCbjEntity,
  ) async {
    _allRoutines[routineCbjEntity.uniqueId.getOrCrash()] = routineCbjEntity;

    // final ClientStatusRequests clientStatusRequests = ClientStatusRequests(
    //   allRemoteCommands:
    //       jsonEncode(routineCbjEntity.toInfrastructure().toJson()),
    //   sendingType: SendingType.routineType.name,
    // );

    // AppRequestsToHub.appRequestsToHubStreamController.add(clientStatusRequests);

    return right(routineCbjEntity);
  }

  @override
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>>
      addOrUpdateNewRoutineInHubFromDevicesPropertyActionList(
    String routineName,
    Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
    RoutineCbjRepeatDateDays daysToRepeat,
    RoutineCbjRepeatDateHour hourToRepeat,
    RoutineCbjRepeatDateMinute minutesToRepeat,
  ) async {
    final RoutineCbjEntity newCbjRoutine =
        NodeRedConverter.convertToRoutineNodes(
      nodeName: routineName,
      devicesPropertyAction: smartDevicesWithActionToAdd,
      daysToRepeat: daysToRepeat,
      hourToRepeat: hourToRepeat,
      minutesToRepeat: minutesToRepeat,
      routineColor: Colors.blueAccent.value,
    );
    return addOrUpdateNewRoutineInHub(newCbjRoutine);
  }

  @override
  Future<Either<RoutineCbjFailure, RoutineCbjEntity>> getRoutine() async {
    //
    // final RoutineCbj routine = RoutineCbj(
    //   uniqueId: UniqueId(),
    //   name: 'Turn on all lights out side',
    //   routinesActionsToExecute: [
    //     'Turn on all lights',
    //     ' Turn on all lights',
    //   ].toImmutableList(),
    // );
    //
    //
    // final Set<String> routinesActionsList = [
    //   'Gut Calling',
    //   'Out Side North',
    // ].toImmutableList();

    try {
      return right(
        RoutineCbjEntity(
          uniqueId: UniqueId(),
          name: RoutineCbjName('Go to sleep ----------- 😴'),
          backgroundColor: RoutineCbjBackgroundColor(Colors.blue.value),
          iconCodePoint: RoutineCbjIconCodePoint(
            null,
            // FontAwesomeIcons.school.codePoint.toString(),
          ),
          image: RoutineCbjBackgroundImage(null),
          automationString: RoutineCbjAutomationString(null),
          nodeRedFlowId: RoutineCbjNodeRedFlowId(null),
          firstNodeId: RoutineCbjFirstNodeId(null),
          lastDateOfExecute: RoutineCbjLastDateOfExecute(null),
          entityStateGRPC: RoutineCbjDeviceStateGRPC(null),
          senderDeviceModel: RoutineCbjSenderDeviceModel(null),
          senderDeviceOs: RoutineCbjSenderDeviceOs(null),
          senderId: RoutineCbjSenderId(null),
          compUuid: RoutineCbjCompUuid(null),
          stateMassage: RoutineCbjStateMassage(null),
          repeateType: RoutineCbjRepeatType(null),
          repeateDateDays: RoutineCbjRepeatDateDays(null),
          repeateDateHour: RoutineCbjRepeatDateHour(null),
          repeateDateMinute: RoutineCbjRepeatDateMinute(null),
        ),
      );
    } catch (e) {
      return left(const RoutineCbjFailure.unexpected());
    }
  }
}
