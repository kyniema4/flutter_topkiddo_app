import 'package:hive/hive.dart';

part 'favorite_sentence_model.g.dart';

@HiveType(typeId: 0)
class FavoriteSentenceModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String idAudioResource;
  @HiveField(2)
  String idTranslatedAudioResource;
  @HiveField(3)
  String keyFrom;
  @HiveField(4)
  String keyTo;
  @HiveField(5)
  String vietnameseNorth;
  @HiveField(6)
  String vietnameseSouth;
  @HiveField(7)
  String spanish;
  @HiveField(8)
  String japanese;
  @HiveField(9)
  String chinese;
  @HiveField(10)
  String french;
  @HiveField(11)
  String english;
  @HiveField(12)
  String american;

  FavoriteSentenceModel(
    this.id,
    this.idAudioResource,
    this.idTranslatedAudioResource,
    this.keyFrom,
    this.keyTo,
    this.vietnameseNorth,
    this.vietnameseSouth,
    this.spanish,
    this.japanese,
    this.chinese,
    this.french,
    this.english,
    this.american,
  );
}
