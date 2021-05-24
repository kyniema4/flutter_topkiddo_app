class LessonModel {
  String _id;
  String idUnit;
  String content;
  int language;
  int sizeContent;
  String colorContent;
  int contentPosition;
  int animationContent;
  String highlightColor;
  List resources;
  List letterResources;
  int type;
}

class LesonResourcesModel{
  String _id;
  String localPath;
  //type 1:image 2:audio 3:video
  int type;

}