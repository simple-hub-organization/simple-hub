import 'package:firedart/firedart.dart';
import 'package:hive/hive.dart';
import 'package:security_bear/infrastructure/core/my_singleton.dart';
import 'package:security_bear/infrastructure/system_commands/system_commands_manager_d.dart';

/// Stores tokens using a Hive store.
/// Depends on the Hive plugin: https://pub.dev/packages/hive
class HiveStore extends TokenStore {
  HiveStore._internal(this._box);

  static const String keyToken = 'auth_token';

  static Future<HiveStore> create() async {
    String hiveFolderPath;
    final String? snapCommonEnvironmentVariablePath =
        await SystemCommandsManager().getSnapCommonEnvironmentVariable();
    if (snapCommonEnvironmentVariablePath == null) {
      final String? currentUserName = await MySingleton.getCurrentUserName();
      hiveFolderPath = '/home/$currentUserName/Documents/hive';
    } else {
      hiveFolderPath = '$snapCommonEnvironmentVariablePath/hive';
    }
//    print('Path of hive: ' + hiveFolderPath);
    Hive.init(hiveFolderPath);
//     Hive.registerAdapter(TokenAdapter());
    final Box box = await Hive.openBox(
      'auth_store',
      compactionStrategy: (int entries, int deletedEntries) =>
          deletedEntries > 50,
    );
    return HiveStore._internal(box);
  }

  final Box _box;

  @override
  Token read() => _box.get(keyToken) as Token;

  @override
  void write(Token? token) => _box.put(keyToken, token);

  @override
  void delete() => _box.delete(keyToken);
}

class TokenAdapter extends TypeAdapter<Token> {
  @override
  final int typeId = 42;

  @override
  void write(BinaryWriter writer, Token token) =>
      writer.writeMap(token.toMap());

  @override
  Token read(BinaryReader reader) =>
      Token.fromMap(reader.readMap().map<String, dynamic>(
          (key, value) => MapEntry<String, dynamic>(key.toString(), value),),);
}
