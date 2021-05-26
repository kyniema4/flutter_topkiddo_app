// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_sentence_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteSentenceModelAdapter extends TypeAdapter<FavoriteSentenceModel> {
  @override
  final int typeId = 1;

  @override
  FavoriteSentenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteSentenceModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteSentenceModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idAudioResource)
      ..writeByte(2)
      ..write(obj.idTranslatedAudioResource)
      ..writeByte(3)
      ..write(obj.keyFrom)
      ..writeByte(4)
      ..write(obj.keyTo)
      ..writeByte(5)
      ..write(obj.vietnameseNorth)
      ..writeByte(6)
      ..write(obj.vietnameseSouth)
      ..writeByte(7)
      ..write(obj.spanish)
      ..writeByte(8)
      ..write(obj.japanese)
      ..writeByte(9)
      ..write(obj.chinese)
      ..writeByte(10)
      ..write(obj.french)
      ..writeByte(11)
      ..write(obj.english)
      ..writeByte(12)
      ..write(obj.american);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteSentenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
