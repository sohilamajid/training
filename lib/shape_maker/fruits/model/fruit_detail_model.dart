class FruitDetailsModel{
  String? image;
  String? text;

  FruitDetailsModel({
    required this.image,
    required this.text,
  });

  FruitDetailsModel.fromJson(Map json){
    image = json["image"];
    text = json["text"];
  }
}