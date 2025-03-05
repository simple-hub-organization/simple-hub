import 'dart:io';

// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/security_bear/i_security_bear_connection_repository.dart';
import 'package:cybearjinni/domain/security_bear/security_bear_failures.dart';
import 'package:cybearjinni/domain/software_info/software_info_entity.dart';
import 'package:cybearjinni/domain/software_info/software_info_failures.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'package:cybearjinni/infrastructure/software_info/software_info_repository.dart';

abstract interface class ISoftwareInfoRepository {
  static ISoftwareInfoRepository? _instance;

  static ISoftwareInfoRepository get instance {
    return _instance ??= _SoftwareInfoRepository();
  }

  Future<Either<SoftwareInfoFailures, SoftwareInfoEntity>> getAppSoftwareInfo();

  Future<Either<SoftwareInfoFailures, SoftwareInfoEntity>> getHubSoftwareInfo();

  Future<Either<SoftwareInfoFailures, SoftwareInfoEntity>>
      getSecurityBearSoftwareInfo();
}
