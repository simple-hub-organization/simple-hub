import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/core/my_singleton.dart';
import 'package:cbj_smart_device/infrastructure/datasources/hive_d/hive_objects_d/isar_database_information_d.dart';
import 'package:cbj_smart_device/infrastructure/datasources/hive_d/hive_objects_d/isar_devices_d.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:isar/isar.dart';

class IsarD {
  factory IsarD() {
    return _instance;
  }

  IsarD._privateConstructor() {
//    contractorAsync();
  }

  static final IsarD _instance = IsarD._privateConstructor();

  String? isarFolderPath;
  static bool? finishedInitializing;
  static const String smartDeviceBoxName = 'SmartDevices';
  static const String cellDeviceListInSmartDeviceBox = 'deviceList';
  static const String cellDatabaseInformationInSmartDeviceBox =
      'databaseInformation';

  late Isar isar;

  Future<bool?> contractorAsync() async {
    try {
      if (finishedInitializing == null) {
        final String? snapCommonEnvironmentVariablePath =
            await SystemCommandsBaseClassD.instance
                .getSnapCommonEnvironmentVariable();
        if (snapCommonEnvironmentVariablePath == null) {
          final String? currentUserName =
              await MySingleton().getCurrentUserName();
          isarFolderPath = '/home/$currentUserName/Documents/isar';
        } else {
          // /var/snap/cybear-jinni/common/isar
          isarFolderPath = '$snapCommonEnvironmentVariablePath/isar';
        }
        logger.i('Path of isar (deprecated): $isarFolderPath');

        await Isar.initializeIsarCore(download: true);
        if (isarFolderPath == null) {
          return false;
        }

        isar = await Isar.open(
          [
            IsarDevicesDSchema,
            IsarDatabaseInformationDSchema,
          ],
          directory: isarFolderPath!,
        );

        finishedInitializing = true;
      }
    } catch (error) {
      logger.e('Error contractorAsync: $error');
    }
    return finishedInitializing;
  }

  Future<Map<String, List<String?>>?> getListOfSmartDevices() async {
    try {
      await contractorAsync();

      final List<IsarDevicesD> isarDeviceD =
          await isar.isarDevicesDs.where().findAll();

      final Map<String, List<String?>> tempListToMap = {};

      for (final IsarDevicesD isarDevicesD in isarDeviceD) {
        final String? key = isarDevicesD.smartDeviceListKey;
        final List<String?>? value = isarDevicesD.smartDeviceListValue;

        if ((key == null || key.isEmpty) || (value == null)) {
          continue;
        }

        tempListToMap.addEntries([MapEntry(key, value)]);
      }
      return tempListToMap;
    } catch (error) {
      logger.e('Error getListOfSmartDevices: $error');
    }
    return null;
  }

  Future<Map<String, String?>?> getListOfDatabaseInformation() async {
    try {
      await contractorAsync();

      final List<IsarDatabaseInformationD> firebaseAccountsInformationMap =
          await isar.isarDatabaseInformationDs.where().findAll();

      final Map<String, String?> tempListToMap = {};

      for (final IsarDatabaseInformationD databaseInformation
          in firebaseAccountsInformationMap) {
        final String? key = databaseInformation.databaseInformationListKey;
        final String? value = databaseInformation.databaseInformationListValue;

        if (key == null || key.isEmpty) {
          continue;
        }

        tempListToMap.addEntries([MapEntry(key, value)]);
      }

      return tempListToMap;
    } catch (error) {
      logger.e('Error getListOfDatabaseInformation: $error');
    }
    return null;
  }

  Future saveAllDevices(
    Map<String, List<String?>> smartDevicesMapList,
  ) async {
    try {
      final Map<String, List<String>> smartDevicesMapListWithoutNull =
          smartDevicesMapList.map((key, value) {
        final List<String> valueList = value.map((e) => e ?? '').toList();
        return MapEntry(key, valueList);
      });

      await contractorAsync();

      final List<IsarDevicesD> isarDeviceDList = [];

      for (final MapEntry<String, List<String>> smartDeviceMapEntry
          in smartDevicesMapListWithoutNull.entries) {
        final IsarDevicesD isarDevicesDTemp = IsarDevicesD()
          ..smartDeviceListKey = smartDeviceMapEntry.key
          ..smartDeviceListValue = smartDeviceMapEntry.value;
        isarDeviceDList.add(isarDevicesDTemp);
      }

      await isar.writeTxn(() async {
        await isar.isarDevicesDs.clear();
        await isar.isarDevicesDs.putAll(isarDeviceDList);
      });
    } catch (error) {
      logger.e('Error saveAllDevices: $error');
    }
    return;
  }

  Future saveListOfDatabaseInformation(
    Map<String, String> firebaseAccountsInformationMap,
  ) async {
    try {
      await contractorAsync();

      final List<IsarDatabaseInformationD> databaseInformationList = [];

      for (final MapEntry<String, String> firebaseAccountInformation
          in firebaseAccountsInformationMap.entries) {
        final IsarDatabaseInformationD isarDevicesDTemp =
            IsarDatabaseInformationD()
              ..databaseInformationListKey = firebaseAccountInformation.key
              ..databaseInformationListValue = firebaseAccountInformation.value;
        databaseInformationList.add(isarDevicesDTemp);
      }

      await isar.writeTxn(() async {
        await isar.isarDatabaseInformationDs.clear();
        await isar.isarDatabaseInformationDs.putAll(databaseInformationList);
      });
    } catch (error) {
      logger.e('Error saveListOfDatabaseInformation: $error');
    }
    return;
  }
}
