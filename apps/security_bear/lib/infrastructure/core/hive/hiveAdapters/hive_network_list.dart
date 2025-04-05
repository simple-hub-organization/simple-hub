import 'package:hive/hive.dart';
import 'package:security_bear/features/security_bear/infrastructure/core/network_entity.dart';

part 'hive_network_list.g.dart';

@HiveType(typeId: 1)
class HiveNetworkList {
  @HiveField(0)
  List<NetworkEntity>? networksInfoList;
}
