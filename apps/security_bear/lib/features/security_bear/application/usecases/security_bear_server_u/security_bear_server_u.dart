import 'dart:io';

import 'package:grpc/src/server/call.dart';
import 'package:security_bear/features/security_bear/application/usecases/network_actions/network_actions.dart';
import 'package:security_bear/features/security_bear/infrastructure/core/network_entity.dart';
import 'package:security_bear/infrastructure/gen/security_bear_server_d/proto_gen_date.dart';
import 'package:security_bear/infrastructure/gen/security_bear_server_d/protoc_as_dart/security_bear_connections.pbgrpc.dart';
import 'package:security_bear/utils.dart';

class SecurityBearServerU extends SecurityBearServiceBase {
  @override
  Future<SBCommendStatus> setWiFiInformation(
    ServiceCall call,
    SecurityBearSetup request,
  ) async {
    try {
      logger.v('Set WiFi information');

      final WiFiInformation wiFiInformationFirstP = request.wiFiFirstPriority;
      final WiFiInformation wiFiInformationSecondP = request.wiFiSecondPriority;

      NetworkActions.firstAndAdminNetworkDefault = NetworkEntity(
        networkName: wiFiInformationFirstP.wiFiName,
        networkPass: wiFiInformationFirstP.wiFiPassword,
      );

      NetworkActions.secondNetworkDefault = NetworkEntity(
        networkName: wiFiInformationSecondP.wiFiName,
        networkPass: wiFiInformationSecondP.wiFiPassword,
      );

      logger.i(
        'First WiFi name: ${wiFiInformationFirstP.wiFiName}\n'
        'First WiFi password: ${wiFiInformationFirstP.wiFiPassword}\n\n'
        'Second WiFi name: ${wiFiInformationSecondP.wiFiName}\n'
        'SecondWiFi password: ${wiFiInformationSecondP.wiFiPassword}',
      );

      return SBCommendStatus(success: true);
    } catch (e) {
      return SBCommendStatus(success: false);
    }
  }

  @override
  Future<SBCommendStatus> setFirebaseAccountAndSecurityBearSetup(
      ServiceCall call, SBFirebaseAccountAndSecurityBearSetup request,) async {
    try {
      final SecurityBearSetup securityBearSetup = request.securityBearSetup;
      final WiFiInformation wiFiInformationFirstP =
          securityBearSetup.wiFiFirstPriority;
      final WiFiInformation wiFiInformationSecondP =
          securityBearSetup.wiFiSecondPriority;

      logger.i(
        'WiFi name: ${wiFiInformationFirstP.wiFiName}, WiFi password:'
        ' ${wiFiInformationFirstP.wiFiPassword}',
      );

      NetworkActions.firstAndAdminNetworkDefault = NetworkEntity(
        networkName: wiFiInformationFirstP.wiFiName,
        networkPass: wiFiInformationFirstP.wiFiPassword,
      );

      NetworkActions.secondNetworkDefault = NetworkEntity(
        networkName: wiFiInformationSecondP.wiFiName,
        networkPass: wiFiInformationSecondP.wiFiPassword,
      );
      return SBCommendStatus(success: true);
    } catch (e) {
      return SBCommendStatus(success: false);
    }
  }

  @override
  Future<CompSecurityBearInfo> getCompSecurityBearInfo(
    ServiceCall call,
    CompSecurityBearInfo request,
  ) async {
    logger.i('Hub info got requested');

    final CbjSecurityBearIno cbjSecurityBearIno = CbjSecurityBearIno(
      deviceName: 'cbj Hub',
      protoLastGenDate: securityBearServerProtocGenDate,
      dartSdkVersion: Platform.version,
    );

    final CompSecurityBearSpecs compSecurityBearSpecs = CompSecurityBearSpecs(
      compOs: Platform.operatingSystem,
    );

    final CompSecurityBearInfo compSecurityBearInfo = CompSecurityBearInfo(
      cbjInfo: cbjSecurityBearIno,
      compSpecs: compSecurityBearSpecs,
    );
    return compSecurityBearInfo;
  }
}
