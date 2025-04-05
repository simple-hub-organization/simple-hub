import 'package:hive/hive.dart';

part 'hub_entity_hive_model.g.dart';

@HiveType(typeId: 1)
class HubEntityHiveModel extends HiveObject {
  @HiveField(0)
  late String hubNetworkBssid;

  @HiveField(1)
  late String networkName;

  @HiveField(2)
  late String lastKnownIp;
}
