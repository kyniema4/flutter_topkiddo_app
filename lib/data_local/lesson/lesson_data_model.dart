import 'dart:convert';

import 'package:hive/hive.dart';

part 'lesson_data_model.g.dart';

@HiveType(typeId: 3)
class LessonDataModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  String unitId;
  @HiveField(4)
  int type;
  @HiveField(5)
  int isLimit;
  @HiveField(6)
  int language;
  @HiveField(7)
  bool isDone;
  LessonDataModel({
    this.id,
    this.name,
    this.description,
    this.unitId,
    this.type,
    this.isLimit,
    this.language,
    this.isDone,
  });
  factory LessonDataModel.fromJson(Map<String, dynamic> parsedJson) {
    return LessonDataModel(
        id: parsedJson['id'] ?? parsedJson['_id'] ?? '',
        name: parsedJson['name'] ?? '',
        description: parsedJson['description'] ?? '',
        unitId: parsedJson['unitId'] ?? '',
        type: parsedJson['type'] ?? 1,
        isLimit: parsedJson['isLimit'] ?? 0,
        language: parsedJson['language'] ?? 2,
        isDone: false);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unitId': unitId,
      'type': type,
      'isLimit': isLimit,
      'language': language,
      'isDone': isDone,
    };
  }
}
