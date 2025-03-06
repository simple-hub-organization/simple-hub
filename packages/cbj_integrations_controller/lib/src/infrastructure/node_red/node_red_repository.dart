import 'dart:convert';

import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_entity.dart';
import 'package:cbj_integrations_controller/src/domain/routine/routine_cbj_entity.dart';
import 'package:cbj_integrations_controller/src/domain/scene/scene_cbj_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:http/http.dart';
import 'package:nodered/nodered.dart';

/// Control Node-RED, create scenes and more
class NodeRedRepository {
  factory NodeRedRepository() => _instance;

  NodeRedRepository._singletonConstractor() {
    nodeRedRepositoryService = NodeRedService();
  }

  static final NodeRedRepository _instance =
      NodeRedRepository._singletonConstractor();

  static late NodeRedService nodeRedRepositoryService;

  // /// List of all the scenes JSONs in Node-RED
  // List<String> scenesList = [];
  //
  // /// List of all the routines JSONs in Node-RED
  // List<String> routinesList = [];
  //
  // /// List of all the bindings JSONs in Node-RED
  // List<String> bindingsList = [];

  /// Function to create new scene in Node-RED
  Future<String> createNewNodeRedScene(SceneCbjEntity sceneCbj) async {
    // final String flowId = sceneCbj.uniqueId.getOrCrash();

    try {
      if (sceneCbj.nodeRedFlowId.getOrCrash() != null) {
        await nodeRedRepositoryService.deleteFlowById(
          sceneCbj.nodeRedFlowId.getOrCrash()!,
        );
      }
      final Response response = await nodeRedRepositoryService.postFlow(
        label: sceneCbj.name.getOrCrash(),
        // nodes: sceneCbj.automationString.getOrCrash()!,
        nodes: '',
        flowId: sceneCbj.uniqueId.getOrCrash(),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBodyJson =
            json.decode(response.body) as Map<String, dynamic>;
        final String flowId = responseBodyJson["id"] as String;
        return flowId;
      } else if (response.statusCode == 400) {
        icLogger.w(
          'Scene probably already exist in node red status code\n${response.statusCode}',
        );
      } else {
        icLogger.e(
          'Error setting scene in node red status code\n${response.statusCode}',
        );
      }
    } catch (e) {
      if (e.toString() ==
          'The remote computer refused the network connection.\r\n') {
        icLogger.e('Node-RED is not installed');
      } else {
        icLogger.e('Node-RED create new scene error:\n$e');
      }
    }
    return "";
  }

  /// Function to create new routine in Node-RED
  Future<String> createNewNodeRedRoutine(RoutineCbjEntity routineCbj) async {
    // await _deviceIsReadyToSendInternetRequests;
    // final String flowId = routineCbj.uniqueId.getOrCrash();

    try {
      // if (routinesList.contains(routineCbj.uniqueId.getOrCrash())) {
      //   await nodeRedApi.deleteFlowById(id: flowId);
      // }
      final Response response = await nodeRedRepositoryService.postFlow(
        label: routineCbj.name.getOrCrash(),
        nodes: routineCbj.automationString.getOrCrash()!,
        flowId: routineCbj.uniqueId.getOrCrash(),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBodyJson =
            json.decode(response.body) as Map<String, dynamic>;
        final String flowId = responseBodyJson["id"] as String;
        return flowId;
      } else if (response.statusCode == 400) {
        icLogger.w(
          'Routine probably already exist in node red status code\n${response.statusCode}',
        );
      } else {
        icLogger.e(
          'Error setting routine in node red status code\n${response.statusCode}',
        );
      }
    } catch (e) {
      if (e.toString() ==
          'The remote computer refused the network connection.\r\n') {
        icLogger.e('Node-RED is not installed');
      } else {
        icLogger.e('Node-RED create new routine error:\n$e');
      }
    }
    return "";
  }

  /// Function to create new binding in Node-RED
  Future<String> createNewNodeRedBinding(BindingCbjEntity bindingCbj) async {
    try {
      // if (bindingsList.contains(bindingCbj.uniqueId.getOrCrash())) {
      //   await nodeRedApi.deleteFlowById(id: flowId);
      // }
      final Response response = await nodeRedRepositoryService.postFlow(
        label: bindingCbj.name.getOrCrash(),
        nodes: bindingCbj.automationString.getOrCrash()!,
        flowId: bindingCbj.uniqueId.getOrCrash(),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBodyJson =
            json.decode(response.body) as Map<String, dynamic>;
        final String flowId = responseBodyJson["id"] as String;
        return flowId;
      } else if (response.statusCode == 400) {
        icLogger.w(
          'Binding probably already exist in node red status code\n${response.statusCode}',
        );
      } else {
        icLogger.e(
          'Error setting binding in node red status code\n${response.statusCode}',
        );
      }
    } catch (e) {
      if (e.toString() ==
          'The remote computer refused the network connection.\r\n') {
        icLogger.e('Node-RED is not installed');
      } else {
        icLogger.e('Node-RED create new Binding error:\n$e');
      }
    }
    return "";
  }
}
