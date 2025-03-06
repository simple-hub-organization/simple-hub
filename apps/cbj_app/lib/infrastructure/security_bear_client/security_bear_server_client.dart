import 'dart:async';

// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:grpc/grpc.dart';

class SecurityBearServerClient {
  static ClientChannel? channel;
  static SecurityBearClient? stub;

  static Future<SBCommendStatus> setWiFisInformation({
    required String deviceIp,
    required int devicePort,
    required String firstWiFiName,
    required String firstWiFiPassword,
    required String secondWiFiName,
    required String secondWiFiPassword,
  }) async {
    await channel?.shutdown();

    channel = createSmartServerClient(
      deviceIp: deviceIp,
      securityBearPort: devicePort,
    );
    stub = SecurityBearClient(channel!);
    SBCommendStatus responseSBCommendStatus = SBCommendStatus();

    final WiFiInformation wiFiInformationFirst = WiFiInformation()
      ..wiFiName = firstWiFiName
      ..wiFiPassword = firstWiFiPassword;

    final WiFiInformation wiFiInformationSecond = WiFiInformation()
      ..wiFiName = secondWiFiName
      ..wiFiPassword = secondWiFiPassword;

    final SecurityBearSetup securityBearSetup = SecurityBearSetup()
      ..wiFiFirstPriority = wiFiInformationFirst
      ..wiFiSecondPriority = wiFiInformationSecond;

    try {
      responseSBCommendStatus =
          await stub!.setWiFiInformation(securityBearSetup);

      logger.i('Greeter client received: $responseSBCommendStatus');
//      await channel.shutdown();
      return responseSBCommendStatus;
    } catch (e) {
      logger.e('Caught error in Security Bear set wifi info\n$e');
    }
//    await channel.shutdown();
    return SBCommendStatus()..success = false;
  }

  ///  Get Security Bear computer and software info
  static Future<CompSecurityBearInfo?> getSecurityBearCompInfo({
    required String addressToSecurityBear,
    required int securityBearPort,
    required CompSecurityBearInfo compSecurityBearInfo,
  }) async {
    await channel?.shutdown();

    channel = createSmartServerClient(
      deviceIp: addressToSecurityBear,
      securityBearPort: securityBearPort,
    );
    stub = SecurityBearClient(channel!);

    try {
      return await stub!.getCompSecurityBearInfo(compSecurityBearInfo);
    } catch (e) {
      logger.e('Caught error while trying to get Security Bear comp info\n$e');
      await channel?.shutdown();
    }
    return null;
  }

  static ClientChannel createSmartServerClient({
    required String deviceIp,
    required int securityBearPort,
  }) {
    return ClientChannel(
      deviceIp,
      port: securityBearPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
