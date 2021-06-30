// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonDataModelAdapter extends TypeAdapter<LessonDataModel> {
  @override
  final int typeId = 3;

  @override
  LessonDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonDataModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      unitId: fields[3] as String,
      type: fields[4] as int,
      isLimit: fields[5] as int,
      language: fields[6] as int,
      isDone: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LessonDataModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.unitId)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.isLimit)
      ..writeByte(6)
      ..write(obj.language)
      ..writeByte(7)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}