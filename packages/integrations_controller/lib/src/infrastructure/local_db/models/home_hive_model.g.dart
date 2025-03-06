// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeHiveModelAdapter extends TypeAdapter<HomeHiveModel> {
  @override
  final int typeId = 1;

  @override
  HomeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeHiveModel()
      ..uniqueId = fields[1] as String
      ..name = fields[2] as String
      ..areas = (fields[3] as List).cast<String>()
      ..entities = (fields[4] as List).cast<String>()
      ..scenes = (fields[5] as List).cast<String>()
      ..routines = (fields[6] as List).cast<String>()
      ..bindings = (fields[7] as List).cast<String>()
      ..mostUsedBy = (fields[8] as List).cast<String>()
      ..permissions = (fields[9] as List).cast<String>()
      ..types = (fields[10] as List).cast<String>()
      ..background = fields[11] as String
      ..network = fields[12] as String;
  }

  @override
  void write(BinaryWriter writer, HomeHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.uniqueId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.areas)
      ..writeByte(4)
      ..write(obj.entities)
      ..writeByte(5)
      ..write(obj.scenes)
      ..writeByte(6)
      ..write(obj.routines)
      ..writeByte(7)
      ..write(obj.bindings)
      ..writeByte(8)
      ..write(obj.mostUsedBy)
      ..writeByte(9)
      ..write(obj.permissions)
      ..writeByte(10)
      ..write(obj.types)
      ..writeByte(11)
      ..write(obj.background)
      ..writeByte(12)
      ..write(obj.network);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
