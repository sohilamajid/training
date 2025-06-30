class SignUpModel {
  bool? status;
  String? errorMessage;
  String? errorMessageEn;
  Data? data;

  SignUpModel({this.status, this.errorMessage, this.errorMessageEn, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorMessage = json['error_message'];
    errorMessageEn = json['error_message_en'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_message'] = this.errorMessage;
    data['error_message_en'] = this.errorMessageEn;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? mobile;
  String? name;
  String? profilePhotoPath;
  String? token;

  Data({this.mobile, this.name, this.profilePhotoPath, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
    profilePhotoPath = json['profile_photo_path'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['token'] = this.token;
    return data;
  }
}