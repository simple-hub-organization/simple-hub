import 'package:isar/isar.dart';

part 'isar_devices_d.g.dart';

@collection
class IsarDevicesD {
  Id id = Isar.autoIncrement;

  String? smartDeviceListKey;
  List<String?>? smartDeviceListValue;
}
