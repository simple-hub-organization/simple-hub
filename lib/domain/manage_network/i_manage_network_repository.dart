import 'dart:io';

// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/home_user/home_user_failures.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_entity.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_value_objects.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:kt_dart/collection.dart';
import 'package:location/location.dart' as location;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';

part 'package:cybearjinni/infrastructure/manage_wifi_repository.dart';

abstract interface class IManageNetworkRepository {
  static IManageNetworkRepository? _instance;

  static IManageNetworkRepository get instance {
    return _instance ??= _ManageWiFiRepository();
  }

  static ManageNetworkEntity? manageWiFiEntity;

  Future<bool> loadWifi();

  Future<Either<HomeUserFailures, String?>> doesWiFiEnabled();

  Stream<Either<HomeUserFailures, KtList<ManageNetworkEntity>>>
      scanWiFiNetworks();

  Future<Either<HomeUserFailures, Unit>> connectToWiFi(
    ManageNetworkEntity networkEntity,
  );

  Future<Either<HomeUserFailures, Unit>> openAccessPoint(
    ManageNetworkEntity networkEntity,
  );

  Future<Either<HomeUserFailures, Unit>> doesAccessPointOpen();
}
