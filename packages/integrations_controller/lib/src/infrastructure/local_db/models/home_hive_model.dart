import 'package:hive/hive.dart';

part 'home_hive_model.g.dart';

@HiveType(typeId: 1)
class HomeHiveModel extends HiveObject {
  /// will be the router bssid
  @HiveField(1)
  late String uniqueId;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late List<String> areas;
  @HiveField(4)
  late List<String> entities;
  @HiveField(5)
  late List<String> scenes;
  @HiveField(6)
  late List<String> routines;
  @HiveField(7)
  late List<String> bindings;
  @HiveField(8)
  late List<String> mostUsedBy;
  @HiveField(9)
  late List<String> permissions;
  @HiveField(10)
  late List<String> types;
  @HiveField(11)
  late String background;
  @HiveField(12)
  late String network;
}
