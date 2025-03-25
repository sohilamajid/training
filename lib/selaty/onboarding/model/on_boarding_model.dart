import 'dart:ui';

class OnBoardingModel {
  String? image;
  String? title;
  String? description;
  Color? lightColor;
  Color? mediumColor;
  Color? darkColor;

  OnBoardingModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.lightColor,
      required this.mediumColor,
      required this.darkColor});

   OnBoardingModel.fromJson(Map json){
    image = json["image"];
    title = json["title"];
    description = json["description"];
    lightColor = json["lightColor"];
    mediumColor = json["mediumColor"];
    darkColor = json["darkColor"];
  }
}
