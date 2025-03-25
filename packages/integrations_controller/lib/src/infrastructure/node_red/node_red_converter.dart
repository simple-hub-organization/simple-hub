import 'dart:collection';

import 'package:integrations_controller/src/domain/binding/binding_cbj_entity.dart';
import 'package:integrations_controller/src/domain/binding/value_objects_routine_cbj.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/core/value_objects.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/routine/routine_cbj_entity.dart';
import 'package:integrations_controller/src/domain/routine/value_objects_routine_cbj.dart';
import 'package:integrations_controller/src/domain/scene/scene_cbj_entity.dart';
import 'package:integrations_controller/src/domain/scene/value_objects_scene_cbj.dart';
import 'package:nodered/nodered.dart';
import 'package:uuid/uuid.dart';

class NodeRedConverter {
  static const String hubBaseTopic = 'CBJ_Hub_Topic';

  static const String devicesTopicTypeName = 'Devices';
  static const String scenesTopicTypeName = 'Scenes';
  static const String routinesTopicTypeName = 'Routines';
  static const String bindingsTopicTypeName = 'bindings';
  static const String nodeRedPluginsApi = 'nodeRedPluginsApi';

  static SceneEntity convertToSceneNodes({
    required String nodeName,
    required Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        devicesPropertyAction,
    required String sceneColor,
  }) {
    final NodeRedMqttBrokerNode brokerNode =
        NodeRedMqttBrokerNode(name: 'CyBear  Jinni Broker');

    final MapEntry<String, Set<String>>
        allNodesAsWellAsAllNodeRedIdToConnectTo =
        getAllNodesAsWellAsAllNodeRedIdToConnectTo(
      devicesPropertyAction: devicesPropertyAction,
      brokerNodeId: brokerNode.id,
    );

    String nodes = allNodesAsWellAsAllNodeRedIdToConnectTo.key;
    final Set<String> allNodeRedIdToConnectTo =
        allNodesAsWellAsAllNodeRedIdToConnectTo.value;

    final MapEntry<String, String> startingSceneNode = createStartingSceneNode(
      nodeName: nodeName,
      brokerId: brokerNode.id,
      wires: allNodeRedIdToConnectTo,
    );
    if (nodes.isEmpty) {
      nodes = '[${startingSceneNode.value}, $brokerNode]';
    } else {
      nodes = '[${startingSceneNode.value}, $nodes, $brokerNode]';
    }

    return SceneEntity(
      uniqueId: UniqueId(),
      name: SceneCbjName(nodeName),
      backgroundColor: SceneCbjBackgroundColor(sceneColor),
      // automationString: SceneCbjAutomationString(nodes),
      nodeRedFlowId: SceneCbjNodeRedFlowId(null),
      firstNodeId: SceneCbjFirstNodeId(startingSceneNode.key),
      iconCodePoint: SceneCbjIconCodePoint(null),
      image: SceneCbjBackgroundImage(null),
      lastDateOfExecute: SceneCbjLastDateOfExecute(null),
      entityStateGRPC: SceneCbjDeviceStateGRPC(
        EntityStateGRPC.addingNewScene.toString(),
      ),
      senderDeviceModel: SceneCbjSenderDeviceModel(null),
      senderDeviceOs: SceneCbjSenderDeviceOs(null),
      senderId: SceneCbjSenderId(null),
      compUuid: SceneCbjCompUuid(null),
      stateMassage: SceneCbjStateMassage(null),
      actions: [],
      areaPurposeType: AreaPurposesTypes.undefined,
      entitiesWithAutomaticPurpose: EntitiesWithAutomaticPurpose(HashSet()),
    );
  }

  static RoutineCbjEntity convertToRoutineNodes({
    required String nodeName,
    required Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        devicesPropertyAction,
    required RoutineCbjRepeatDateDays daysToRepeat,
    required RoutineCbjRepeatDateHour hourToRepeat,
    required RoutineCbjRepeatDateMinute minutesToRepeat,
    required String routineColor,
  }) {
    final NodeRedMqttBrokerNode brokerNode =
        NodeRedMqttBrokerNode(name: 'CyBear  Jinni Broker');

    final MapEntry<String, Set<String>>
        allNodesAsWellAsAllNodeRedIdToConnectTo =
        getAllNodesAsWellAsAllNodeRedIdToConnectTo(
      devicesPropertyAction: devicesPropertyAction,
      brokerNodeId: brokerNode.id,
    );

    String nodes = allNodesAsWellAsAllNodeRedIdToConnectTo.key;
    final Set<String> allNodeRedIdToConnectTo =
        allNodesAsWellAsAllNodeRedIdToConnectTo.value;

    final MapEntry<String, String> startingRoutineNode =
        createStartingRoutineNode(
      nodeName: nodeName,
      wires: allNodeRedIdToConnectTo,
      daysToRepeat: daysToRepeat,
      hourToRepeat: hourToRepeat,
      minutesToRepeat: minutesToRepeat,
    );

    nodes = '[${startingRoutineNode.value}, $nodes, $brokerNode]';

    return RoutineCbjEntity(
      uniqueId: UniqueId(),
      name: RoutineCbjName(nodeName),
      backgroundColor: RoutineCbjBackgroundColor(routineColor),
      automationString: RoutineCbjAutomationString(nodes),
      nodeRedFlowId: RoutineCbjNodeRedFlowId(null),
      firstNodeId: RoutineCbjFirstNodeId(startingRoutineNode.key),
      iconCodePoint: RoutineCbjIconCodePoint(null),
      image: RoutineCbjBackgroundImage(null),
      lastDateOfExecute: RoutineCbjLastDateOfExecute(null),
      entityStateGRPC: RoutineCbjDeviceStateGRPC(
        EntityStateGRPC.addingNewRoutine.toString(),
      ),
      senderDeviceModel: RoutineCbjSenderDeviceModel(null),
      senderDeviceOs: RoutineCbjSenderDeviceOs(null),
      senderId: RoutineCbjSenderId(null),
      compUuid: RoutineCbjCompUuid(null),
      stateMassage: RoutineCbjStateMassage(null),
      repeateType:
          RoutineCbjRepeatType(WhenToExecute.betweenSelectedTime.toString()),
      repeateDateDays: RoutineCbjRepeatDateDays(daysToRepeat.getOrCrash()),
      repeateDateHour: RoutineCbjRepeatDateHour(hourToRepeat.getOrCrash()),
      repeateDateMinute:
          RoutineCbjRepeatDateMinute(minutesToRepeat.getOrCrash()),
    );
  }

  static BindingCbjEntity convertToBindingNodes({
    required String nodeName,
    required Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        devicesPropertyAction,
    required String bindingColor,
  }) {
    final NodeRedMqttBrokerNode brokerNode =
        NodeRedMqttBrokerNode(name: 'CyBear  Jinni Broker');

    final MapEntry<String, Set<String>>
        allNodesAsWellAsAllNodeRedIdToConnectTo =
        getAllNodesAsWellAsAllNodeRedIdToConnectTo(
      devicesPropertyAction: devicesPropertyAction,
      brokerNodeId: brokerNode.id,
    );

    String nodes = allNodesAsWellAsAllNodeRedIdToConnectTo.key;
    final Set<String> allNodeRedIdToConnectTo =
        allNodesAsWellAsAllNodeRedIdToConnectTo.value;

    final MapEntry<String, String> startingBindingNode =
        createStartingBindingNode(
      nodeName: nodeName,
      brokerNodeId: brokerNode.id,
      wires: allNodeRedIdToConnectTo,
    );

    nodes = '[${startingBindingNode.value}, $nodes, $brokerNode]';

    return BindingCbjEntity(
      uniqueId: UniqueId(),
      name: BindingCbjName(nodeName),
      backgroundColor: BindingCbjBackgroundColor(bindingColor),
      automationString: BindingCbjAutomationString(nodes),
      nodeRedFlowId: BindingCbjNodeRedFlowId(null),
      firstNodeId: BindingCbjFirstNodeId(startingBindingNode.key),
      iconCodePoint: BindingCbjIconCodePoint(null),
      image: BindingCbjBackgroundImage(null),
      lastDateOfExecute: BindingCbjLastDateOfExecute(null),
      entityStateGRPC: BindingCbjDeviceStateGRPC(
        EntityStateGRPC.addingNewBinding.toString(),
      ),
      senderDeviceModel: BindingCbjSenderDeviceModel(null),
      senderDeviceOs: BindingCbjSenderDeviceOs(null),
      senderId: BindingCbjSenderId(null),
      compUuid: BindingCbjCompUuid(null),
      stateMassage: BindingCbjStateMassage(null),
    );
  }

  /// Returns the string id of the function to connect to and the whole function
  /// plus mqtt out string as node-red structure
  static MapEntry<String, String> convertToNodeString({
    required DeviceEntityBase device,
    required String property,
    required String action,
    required String brokerNodeId,
  }) {
    final String topic =
        '$hubBaseTopic/$devicesTopicTypeName/${device.uniqueId.getOrCrash()}/$property';
    final NodeRedMqttOutNode mqttNode = NodeRedMqttOutNode(
      brokerNodeId: brokerNodeId,
      topic: topic,
      name: '${device.cbjEntityName.getOrCrash()} - $property',
    );

    final NodeRedFunctionNode functionForNode =
        NodeRedFunctionNode.passOnlyNewAction(
      action: action,
      name: action,
      wires: {
        {
          mqttNode.id,
        },
      },
    );

    return MapEntry(
      functionForNode.id,
      '$functionForNode, $mqttNode',
    );
  }

  static MapEntry<String, String> createStartingSceneNode({
    required String nodeName,
    required String brokerId,
    required Set<String> wires,
  }) {
    final String mqttInNodeId = const Uuid().v1();
    final String topic = '$hubBaseTopic/$scenesTopicTypeName/$mqttInNodeId';
    final NodeRedMqttInNode nodeRedMqttInNode = NodeRedMqttInNode(
      name: nodeName,
      brokerNodeId: brokerId,
      topic: topic,
      wires: {wires},
      tempId: mqttInNodeId,
    );
    return MapEntry(nodeRedMqttInNode.id, nodeRedMqttInNode.toString());
  }

  static MapEntry<String, String> createStartingRoutineNode({
    required String nodeName,
    required Set<String> wires,
    required RoutineCbjRepeatDateDays daysToRepeat,
    required RoutineCbjRepeatDateHour hourToRepeat,
    required RoutineCbjRepeatDateMinute minutesToRepeat,
  }) {
    final String injectNodeId = const Uuid().v1();
    final NodeRedInjectNode nodeRedInjectNode = NodeRedInjectNode(
      name: nodeName,
      wires: {wires},
      tempId: injectNodeId,
      daysToRepeat: daysToRepeat.getOrCrash()?.toSet(),
      hourToRepeat: hourToRepeat.getOrCrash(),
      minutesToRepeat: minutesToRepeat.getOrCrash(),
    );
    return MapEntry(nodeRedInjectNode.id, nodeRedInjectNode.toString());
  }

  static MapEntry<String, String> createStartingBindingNode({
    required String nodeName,
    required String brokerNodeId,
    required Set<String> wires,
  }) {
    final String mqttInNodeId = const Uuid().v1();
    final String topic = '$hubBaseTopic/$bindingsTopicTypeName/$mqttInNodeId';
    final NodeRedMqttInNode nodeRedMqttInNode = NodeRedMqttInNode(
      name: nodeName,
      brokerNodeId: brokerNodeId,
      topic: topic,
      wires: {wires},
      tempId: mqttInNodeId,
    );
    return MapEntry(nodeRedMqttInNode.id, nodeRedMqttInNode.toString());
  }

  static MapEntry<String, Set<String>>
      getAllNodesAsWellAsAllNodeRedIdToConnectTo({
    required Set<MapEntry<DeviceEntityBase, MapEntry<String?, String?>>>
        devicesPropertyAction,
    required String brokerNodeId,
  }) {
    final Set<String> allNodeRedIdToConnectTo = {};
    String nodes = '';

    for (final MapEntry<DeviceEntityBase,
        MapEntry<String?, String?>> deviceEntry in devicesPropertyAction) {
      final DeviceEntityBase device = deviceEntry.key;
      final String? property = deviceEntry.value.key;
      final String? action = deviceEntry.value.value;

      if (property == null || action == null) {
        continue;
      }
      final MapEntry<String, String> nodeRedStringNode = convertToNodeString(
        brokerNodeId: brokerNodeId,
        device: device,
        property: property,
        action: action,
      );

      if (nodes.isNotEmpty) {
        nodes += ', ';
      }
      // ignore: use_string_buffers
      nodes += nodeRedStringNode.value;
      allNodeRedIdToConnectTo.add(nodeRedStringNode.key);
    }
    return MapEntry(nodes, allNodeRedIdToConnectTo);
  }
}
