class LessonModel {
  String id;
  String name;
  String description;
  String unitId;
  int type;
  int isLimit;
  int language;
  List tags;
  List part;
  LessonModel({
    this.id,
    this.name,
    this.description,
    this.unitId,
    this.type,
    this.isLimit,
    this.language,
    this.tags,
    this.part,
  });

  factory LessonModel.fromJson(Map<String, dynamic> parsedJson) {
    return LessonModel(
      id: parsedJson['_id'] ?? "",
      name: parsedJson['name'] ?? "",
      description: parsedJson['description'] ?? "",
      unitId: parsedJson['unitId'] ?? "",
      type: parsedJson['type'] ?? 1,
      isLimit: parsedJson['isLimit'] ?? 0,
      language: parsedJson['language'] ?? 2,
      tags: parsedJson['tags'] ?? [],
      part: parsedJson['part'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unitId': unitId,
      'type': type,
      'isLimit': isLimit,
      'languages': language,
      'tags': tags,
      'part': part,
    };
  }
}
