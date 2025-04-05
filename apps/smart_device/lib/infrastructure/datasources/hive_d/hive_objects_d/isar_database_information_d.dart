import 'package:isar/isar.dart';

part 'isar_database_information_d.g.dart';

@collection
class IsarDatabaseInformationD {
  Id id = Isar.autoIncrement;

  String? databaseInformationListKey;
  String? databaseInformationListValue;
}
