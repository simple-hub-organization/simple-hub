part of 'package:integrations_controller/src/domain/binding/i_binding_cbj_repository.dart';

@Deprecated('New architecture. Moved to AutomationService')
class _BindingCbjRepository implements IBindingCbjRepository {
  final Map<String, BindingCbjEntity> _allBindings = {};

  @override
  Future<Set<BindingCbjEntity>> getAllBindingsAsList() async {
    return _allBindings.values.toSet();
  }

  @override
  Future<Map<String, BindingCbjEntity>> getAllBindingsAsMap() async {
    return _allBindings;
  }

  @override
  Future<Either<BindingCbjFailure, Unit>> addNewBinding(
    BindingCbjEntity bindingCbj,
  ) async {
    BindingCbjEntity tempBindingCbj = bindingCbj;

    /// Check if binding already exist
    if (findBindingIfAlreadyBeenAdded(tempBindingCbj) == null) {
      _allBindings.addEntries(
        [MapEntry(tempBindingCbj.uniqueId.getOrCrash(), tempBindingCbj)],
      );

      final String entityId = tempBindingCbj.uniqueId.getOrCrash();

      /// If it is new binding
      _allBindings[entityId] = tempBindingCbj;

      final String bindingNodeRedFlowId =
          await NodeRedRepository().createNewNodeRedBinding(tempBindingCbj);
      if (bindingNodeRedFlowId.isNotEmpty) {
        tempBindingCbj = tempBindingCbj.copyWith(
          nodeRedFlowId: BindingCbjNodeRedFlowId(bindingNodeRedFlowId),
        );
      }
    }
    return right(unit);
  }

  @override
  Future<bool> activateBinding(BindingCbjEntity bindingCbj) async {
    final String fullPathOfBinding = await getFullMqttPathOfBinding(bindingCbj);
    IMqttServerRepository.instance
        .publishMessage(fullPathOfBinding, DateTime.now().toString());

    return true;
  }

  /// Get entity and return the full MQTT path to it
  @override
  Future<String> getFullMqttPathOfBinding(BindingCbjEntity bindingCbj) async {
    final String hubBaseTopic =
        IMqttServerRepository.instance.getHubBaseTopic();
    final String bindingsTopicTypeName =
        IMqttServerRepository.instance.getBindingsTopicTypeName();
    final String bindingId = bindingCbj.firstNodeId.getOrCrash()!;

    return '$hubBaseTopic/$bindingsTopicTypeName/$bindingId';
  }

  /// Check if all bindings does not contain the same binding already
  /// Will compare the unique id's that each company sent us
  BindingCbjEntity? findBindingIfAlreadyBeenAdded(
    BindingCbjEntity bindingEntity,
  ) {
    return _allBindings[bindingEntity.uniqueId.getOrCrash()];
  }

  @override
  Future<Either<BindingCbjFailure, BindingCbjEntity>> getBinding() async {
    //
    // final BindingCbj binding = BindingCbj(
    //   uniqueId: UniqueId(),
    //   name: 'Turn on all lights out side',
    //   bindingsActionsToExecute: [
    //     'Turn on all lights',
    //     ' Turn on all lights',
    //   ].toImmutableList(),
    // );
    //
    //
    // final Set<String> bindingsActionsList = [
    //   'Gut Calling',
    //   'Out Side North',
    // ].toImmutableList();

    try {
      return right(
        BindingCbjEntity(
          uniqueId: UniqueId(),
          name: BindingCbjName('Go to sleep ----------- 😴'),
          backgroundColor: BindingCbjBackgroundColor(Colors.blue.value),
          iconCodePoint: BindingCbjIconCodePoint(
            null,
            // FontAwesomeIcons.school.codePoint.toString(),
          ),
          image: BindingCbjBackgroundImage(null),
          automationString: BindingCbjAutomationString(null),
          nodeRedFlowId: BindingCbjNodeRedFlowId(null),
          firstNodeId: BindingCbjFirstNodeId(null),
          lastDateOfExecute: BindingCbjLastDateOfExecute(null),
          entityStateGRPC: BindingCbjDeviceStateGRPC(null),
          senderDeviceModel: BindingCbjSenderDeviceModel(null),
          senderDeviceOs: BindingCbjSenderDeviceOs(null),
          senderId: BindingCbjSenderId(null),
          compUuid: BindingCbjCompUuid(null),
          stateMassage: BindingCbjStateMassage(null),
        ),
      );
    } catch (e) {
      return left(const BindingCbjFailure.unexpected());
    }
  }

  @override
  Future<Either<BindingCbjFailure, BindingCbjEntity>>
      addOrUpdateNewBindingInHub(
    BindingCbjEntity bindingCbjEntity,
  ) async {
    _allBindings[bindingCbjEntity.uniqueId.getOrCrash()] = bindingCbjEntity;

    // final ClientStatusRequests clientStatusRequests = ClientStatusRequests(
    //   allRemoteCommands:
    //       jsonEncode(bindingCbjEntity.toInfrastructure().toJson()),
    //   sendingType: SendingType.bindingsType.name,
    // );

    // AppRequestsToHub.appRequestsToHubStreamController.add(clientStatusRequests);

    return right(bindingCbjEntity);
  }

  @override
  Future<Either<BindingCbjFailure, BindingCbjEntity>>
      addOrUpdateNewBindingInHubFromDevicesPropertyActionList(
    String bindingName,
    Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        smartDevicesWithActionToAdd,
  ) async {
    final BindingCbjEntity newCbjBinding =
        NodeRedConverter.convertToBindingNodes(
      nodeName: bindingName,
      devicesPropertyAction: smartDevicesWithActionToAdd,
      bindingColor: Colors.orangeAccent.value,
    );
    return addOrUpdateNewBindingInHub(newCbjBinding);
  }

  @override
  Future<Either<BindingCbjFailure, Unit>> activateBindings(
    Set<BindingCbjEntity> bindingsList,
  ) async {
    for (final BindingCbjEntity bindingCbjEntity in bindingsList) {
      addOrUpdateNewBindingInHub(
        bindingCbjEntity.copyWith(
          entityStateGRPC: BindingCbjDeviceStateGRPC(
            CbjDeviceStateGRPC.waitingInComp.toString(),
          ),
        ),
      );
    }
    return right(unit);
  }

  @override
  void addOrUpdateNewBindingInApp(BindingCbjEntity bindingCbj) {
    _allBindings[bindingCbj.uniqueId.getOrCrash()] = bindingCbj;

    bindingsResponseFromTheHubStreamController.sink
        .add(_allBindings.values.toSet());
  }

  @override
  Future initiateHubConnection() async {}

  @override
  Stream<Either<BindingCbjFailure, Set<BindingCbjEntity>>>
      watchAllBindings() async* {
    yield* bindingsResponseFromTheHubStreamController.stream
        .map((event) => right(event));
  }

  @override
  BehaviorSubject<Set<BindingCbjEntity>>
      bindingsResponseFromTheHubStreamController =
      BehaviorSubject<Set<BindingCbjEntity>>();
}
