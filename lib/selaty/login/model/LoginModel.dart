class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? roleId;
  Null address;
  String? profilePhotoPath;
  String? token;
  String? profilePhotoUrl;

  Data(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.roleId,
        this.address,
        this.profilePhotoPath,
        this.token,
        this.profilePhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    roleId = json['role_id'];
    address = json['address'];
    profilePhotoPath = json['profile_photo_path'];
    token = json['token'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['role_id'] = roleId;
    data['address'] = address;
    data['profile_photo_path'] = profilePhotoPath;
    data['token'] = token;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}