import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cybearjinni/infrastructure/core/injection.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:cybearjinni/infrastructure/network_utilities_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:location/location.dart';
import 'package:network_info_plus/network_info_plus.dart';
// ignore: depend_on_referenced_packages a
import 'package:network_tools_flutter/network_tools_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:rxdart/rxdart.dart';

part 'package:cybearjinni/infrastructure/connection_service/app_connection_service.dart';
part 'package:cybearjinni/infrastructure/connection_service/demo_connection_service.dart';
part 'package:cybearjinni/infrastructure/connection_service/hub_connection_service.dart';
part 'package:cybearjinni/infrastructure/connection_service/none_connection_service.dart';
part 'package:cybearjinni/infrastructure/connection_service/remote_pipes_connection_service.dart';

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

  Future searchDevices();

  void setEntityState(RequestActionObject action);

  Future setEntitiesToArea(String areaId, HashSet<String> entities);

  Future<HashMap<String, DeviceEntityBase>> get getEntities;

  Future<HashMap<String, AreaEntity>> get getAreas;

  Stream<MapEntry<String, DeviceEntityBase>> watchEntities();

  Stream<MapEntry<String, AreaEntity>> watchAreas();

  Future dispose();

  Future setNewArea(AreaEntity area);

  Future<HashMap<String, SceneCbjEntity>> get getScenes;

  Future activateScene(String id);

  Future addScene(SceneCbjEntity scene);

  Future loginVendor(VendorLoginEntity value);

  Future<List<VendorEntityInformation>> getVendors();
}
