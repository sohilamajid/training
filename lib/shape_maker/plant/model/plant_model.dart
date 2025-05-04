class PlantModel{
  String? image;
  String? text;
  String? subtext;
  String? number;

  PlantModel({
    required this.image,
    required this.text,
    required this.subtext,
    required this.number,
});

  PlantModel.fromJson(Map json){
    image = json["image"];
    text = json["text"];
    subtext = json["subtext"];
    number = json["number"];
  }
}
