class FruitModel{
  String? image;
  String? text;
  String? label;
  String? subtext;

  FruitModel({
    required this.image,
    required this.text,
    required this.label,
    required this.subtext,
  });

  FruitModel.fromJson(Map json){
    image = json["image"];
    text = json["text"];
    label = json["label"];
    subtext = json["subtext"];
  }
}