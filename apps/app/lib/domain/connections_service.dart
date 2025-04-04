import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
// ignore: depend_on_referenced_packages because this is our package
import 'package:integrations_controller/integrations_controller.dart';
import 'package:location/location.dart';
import 'package:network_info_plus/network_info_plus.dart';
// ignore: depend_on_referenced_packages a
import 'package:network_tools_flutter/network_tools_flutter.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:rxdart/rxdart.dart';
import 'package:simple_hub/infrastructure/core/injection.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';

part 'package:simple_hub/infrastructure/connection_service/app_connection_service.dart';
part 'package:simple_hub/infrastructure/connection_service/demo_connection_service.dart';
part 'package:simple_hub/infrastructure/connection_service/hub_connection_service.dart';
part 'package:simple_hub/infrastructure/connection_service/none_connection_service.dart';
part 'package:simple_hub/infrastructure/connection_service/remote_pipes_connection_service.dart';

enum ConnectionType {
  appAsHub,
  hub,
  remotePipes,
  demo,
  none,
  ;
}

abstract interface class ConnectionsService {
  static ConnectionsService? _instance;

  static ConnectionsService get instance {
    return _instance ??= _NoneConnectionService();
  }

  static ConnectionType _currentConnectionType = ConnectionType.none;

  static void setCurrentConnectionType({
    required String networkBssid,
    required ConnectionType connectionType,
  }) {
    if (connectionType == _currentConnectionType) {
      return;
    }
    _instance?.dispose();

    _currentConnectionType = connectionType;

    switch (connectionType) {
      case ConnectionType.appAsHub:
        _instance = _AppConnectionService(networkBssid);
      case ConnectionType.hub:
        _instance = _HubConnectionService(networkBssid);
      case ConnectionType.remotePipes:
        _instance = _RemotePipesConnectionService(networkBssid);
      case ConnectionType.demo:
        _instance = _DemoConnectionService(networkBssid);
      case ConnectionType.none:
        _instance = _NoneConnectionService();
    }
  }

  static ConnectionType getCurrentConnectionType() => _currentConnectionType;

  Future<bool> connect({String? address});

  Future<Either<HubFailures, Unit>> searchDevices();

  void setEntityState(RequestActionObject action);

  Future setEntitiesToArea(String areaId, HashSet<String> entities);

  Future<HashMap<String, DeviceEntityBase>> get getEntities;

  Future<HashMap<String, AreaEntity>> get getAreas;

  Stream<MapEntry<String, DeviceEntityBase>> watchEntities();

  Stream<MapEntry<String, AreaEntity>> watchAreas();

  Stream<MapEntry<String, SceneEntity>> watchScenes();

  Future dispose();

  Future setNewArea(AreaEntity area);

  Future<HashMap<String, SceneEntity>> get getScenes;

  Future activateScene(String id);

  Future addScene(SceneEntity scene);

  Future loginVendor(VendorLoginEntity value);

  Future<List<VendorEntityInformation>> getVendors();

  Future requestAreaEntitiesScenes();
}
