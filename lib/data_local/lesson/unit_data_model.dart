import 'dart:convert';

import 'package:hive/hive.dart';

part 'unit_data_model.g.dart';

@HiveType(typeId: 0)
class UnitDataModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int level;
  @HiveField(3)
  int language;
  @HiveField(4)
  String image;
  @HiveField(5)
  String description;

  UnitDataModel({
    this.id,
    this.name,
    this.level,
    this.language,
    this.image,
    this.description,
  });

  factory UnitDataModel.fromJson(Map<String, dynamic> parsedJson) {
    return UnitDataModel(
      id: parsedJson['_id'] ?? "",
      name: parsedJson['name'] ?? "",
      level: parsedJson['level'] ?? 1,
      language: parsedJson['language'] ?? 2,
      description: parsedJson['description'] ?? "",
      image: parsedJson['image'] ?? null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'language': language,
      'image': image,
      'decription': description,
    };
  }
}
