import 'dart:convert';

//Unit>Lesson>Topic>FlashCard>Resource-LetterResource


class FlashCard {
  String id;
  String content;
  int language;
  int sizeContent;
  int contentPosition;
  String colorContent;
  int animationContent;
  String highlightColor;
  int type;
  List resource;
  List letterResources;
  FlashCard({
    this.id,
    this.content,
    this.language,
    this.sizeContent,
    this.contentPosition,
    this.colorContent,
    this.animationContent,
    this.highlightColor,
    this.type,
    this.resource,
    this.letterResources,
  });

  factory FlashCard.fromJson(Map<String, dynamic> parsedJson) {
    return FlashCard(
      id: parsedJson['_id'] ?? "",
      content: parsedJson['content'] ?? "",
      language: parsedJson['language'] ?? 2,
      sizeContent: parsedJson['sizeContent'] ?? 15,
      contentPosition: parsedJson['contentPosition'] ?? 4,
      colorContent: parsedJson['colorContent'] ?? "#FF0000",
      animationContent: parsedJson['animationContent'] ?? 1,
      highlightColor: parsedJson['highlightColor'] ?? "#FCF54C",
      type: parsedJson['type'] ?? 1,
      resource: [],
      letterResources: [],
      // resource: List.from(parsedJson['resource']??""),
      // letterResources: List.from(parsedJson['letterResources']??""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'language': language,
      'sizeContent': sizeContent,
      'contentPosition': contentPosition,
      'colorContent': colorContent,
      'animationContent': animationContent,
      'highlightColor': highlightColor,
      'type': type,
      'resource': resource,
      'letterResources': letterResources,
    };
  }
}

class FlashCardResourceModel {
  String id;
  int type;
  String localPath;
  String name;
}

class FlashCardLetterResourceModel {
  String id;
  String letter;
  String image;
  String imageId;
  String audio;
  String audioId;
  List timeFrame;
}
