// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitDataModelAdapter extends TypeAdapter<UnitDataModel> {
  @override
  final int typeId = 0;

  @override
  UnitDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitDataModel(
      id: fields[0] as String,
      name: fields[1] as String,
      level: fields[2] as int,
      language: fields[3] as int,
      image: fields[4] as String,
      description: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UnitDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.level)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
