import 'package:hive/hive.dart';
import 'package:security_bear/features/security_bear/infrastructure/core/network_entity.dart';
import 'package:security_bear/infrastructure/core/hive/hiveAdapters/hive_network_list.dart';
import 'package:security_bear/infrastructure/core/hive/hive_store_d.dart';
import 'package:security_bear/infrastructure/core/my_singleton.dart';
import 'package:security_bear/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:security_bear/utils.dart';

class HiveD {
  factory HiveD() {
    return _instance;
  }

  HiveD._privateConstructor() {
//    contractorAsync();
  }

  static final HiveD _instance = HiveD._privateConstructor();

  String? hiveFolderPath;
  static bool? finishedInitializing;
  static const String securityBearBoxName = 'SecurityBear';
  static const String cellNetworkNamesBox = 'NetworkNames';
  static const String cellDatabaseInformationInNetworkBox =
      'databaseInformation';

  Future<bool?> contractorAsync() async {
    try {
      if (finishedInitializing == null) {
        final String? snapCommonEnvironmentVariablePath =
            await SystemCommandsManager().getSnapCommonEnvironmentVariable();
        if (snapCommonEnvironmentVariablePath == null) {
          final String? currentUserName =
              await MySingleton.getCurrentUserName();
          hiveFolderPath = '/home/$currentUserName/Documents/hive';
        } else {
          hiveFolderPath = '$snapCommonEnvironmentVariablePath/hive';
        }
        logger.i('Path of hive: $hiveFolderPath');
        Hive.init(hiveFolderPath);
        //
        // Hive.openBox(
        //     smartDeviceBoxName); // TODO: check if need await, it creates error: HiveError: Cannot read, unknown typeId: 34
        Hive.registerAdapter(TokenAdapter());
        Hive.registerAdapter(HiveNetworkListAdapter());

        finishedInitializing = true;
      }
    } catch (error) {
      logger.e('error: $error');
    }
    return finishedInitializing;
  }

  Future<List<NetworkEntity>?> getListOfNetworks() async {
    try {
      await contractorAsync();

      final box = await Hive.openBox(securityBearBoxName);

      final HiveNetworkList hiveNetworkList =
          box.get(cellNetworkNamesBox) as HiveNetworkList;

      return hiveNetworkList.networksInfoList;
    } catch (error) {
      logger.e('error: $error');
    }
    return null;
  }
  //
  // Future<List<NetworkEntity>> getListOfDatabaseInformation() async {
  //   try {
  //     await contractorAsync();
  //
  //     final box = await Hive.openBox(securityBearBoxName);
  //
  //     final HiveNetwokList firebaseAccountsInformationMap =
  //         box.get(cellDatabaseInformationInSmartDeviceBox) as NetworkEntity;
  //
  //     return firebaseAccountsInformationMap?.databaseInformationList;
  //   } catch (error) {
  //     print('error: $error');
  //   }
  //   return null;
  // }

  Future<void> saveAllNetworks(List<NetworkEntity> networkList) async {
    try {
      await contractorAsync();

      final Box box = await Hive.openBox(securityBearBoxName);

      final HiveNetworkList hiveNetworkList = HiveNetworkList()
        ..networksInfoList = networkList;

      await box.put(cellNetworkNamesBox, hiveNetworkList).catchError((a) {
        logger.e('Error is: $a');
      });
    } catch (error) {
      logger.e('error: $error');
    }
    return;
  }

  // Future<void> saveListOfDatabaseInformation(
  //     Map<String, String> firebaseAccountsInformationMap) async {
  //   try {
  //     await contractorAsync();
  //
  //     final box = await Hive.openBox(securityBearBoxName);
  //
  //     final HiveNetworkList hiveDevicesD = HiveNetworkList()
  //       ..databaseInformationList = firebaseAccountsInformationMap;
  //
  //     await box.put(cellDatabaseInformationInSmartDeviceBox, hiveDevicesD);
  //   } catch (error) {
  //     print('error: $error');
  //   }
  //   return;
  // }
}
