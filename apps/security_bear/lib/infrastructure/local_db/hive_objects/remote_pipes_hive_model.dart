import 'package:hive/hive.dart';

part 'remote_pipes_hive_model.g.dart';

@HiveType(typeId: 0)
class RemotePipesHiveModel extends HiveObject {
  @HiveField(0)
  late String domainName;
}
