import 'dart:io';

import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/shared_variables.dart';
import 'package:integrations_controller/src/infrastructure/system_commands/bash_commands_d/common_bash_commands_d.dart';
import 'package:integrations_controller/src/infrastructure/system_commands/batch_commands_d/common_batch_commands_d.dart';
import 'package:multicast_dns/multicast_dns.dart';

abstract class SystemCommandsBaseClassD {
  static late SystemCommandsBaseClassD instance;

  Future<String> getCurrentUserName();

  Future<String> getLocalDbPath();

  Future<String> getUuidOfCurrentDevice();

  Future<String> getDeviceHostName();

  Future<String> getAllEtcReleaseFilesText();

  Future<String?> getFileContent(String fileFullPath);

  Future<String?> getDeviceConfiguration();

  Future<String> getProjectFilesLocation();

  Future<String?> suspendComputer();

  Future<String?> shutdownComputer();

  Future<String?> getRaspberryPiDeviceVersion();

  Future<String?> getIp() async {
    for (final NetworkInterface interface in await NetworkInterface.list()) {
//      print('== Interface: ${interface.name} ==');
      for (final InternetAddress address in interface.addresses) {
//        print(
//            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        return address.address;
      }
    }
    return null;
  }

  String getOs() {
    return Platform.operatingSystem;
  }

  String getOsVersion() {
    return Platform.operatingSystemVersion;
  }

  Future<String?> getSnapCommonEnvironmentVariable() {
    return Future.value(SharedVariables().getSnapCommonEnvironmentVariable());
  }

  Future<String?> getIpFromMdnsName(
    String mdnsName,
    String mdnsServiceType,
  ) async {
    try {
      final MDnsClient client = MDnsClient();
      await client.start();

      await for (final PtrResourceRecord _ in client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer(mdnsServiceType),
      )) {
        await for (final IPAddressResourceRecord ip
            in client.lookup<IPAddressResourceRecord>(
          ResourceRecordQuery.addressIPv4(mdnsName),
        )) {
          return ip.address.address;
        }
      }
      client.stop();
    } catch (e) {
      icLogger.e('Error mdns lookup $e');
    }
    return null;
  }
}

Future<SystemCommandsBaseClassD?> setInstanceForDartNative() async {
  if (Platform.isLinux) {
    icLogger.t('Linux platform detected in SystemCommandsManager');
    return SystemCommandsBaseClassD.instance = CommonBashCommandsD();
  } else if (Platform.isWindows) {
    icLogger.t('Windows platform detected in SystemCommandsManager');
    return SystemCommandsBaseClassD.instance = CommonBatchCommandsD();
  } else if (Platform.isMacOS) {
    icLogger.w('Mac os is currently not supported in SystemCommandsManager');
    throw 'Mac os is currently not supported';
  } else {
    icLogger.e(
      '${Platform.operatingSystem} os is not supported in SystemCommandsManager',
    );
    throw '${Platform.operatingSystem} os is not supported';
  }
}
