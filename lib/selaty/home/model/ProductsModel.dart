class ProductsModel {
  bool? status;
  String? message;
  List<Data>? data;

  ProductsModel({this.status, this.message, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? nameEn;
  double? price;
  String? img;
  int? quantity;
  int? categoryId;
  double? discount;
  String? unit;
  String? createdAt;
  String? orderDetailsSumQuantity;
  String? createdAtFormatted;
  double? priceAfterDiscount;
  Category? category;

  Data(
      {this.id,
        this.name,
        this.nameEn,
        this.price,
        this.img,
        this.quantity,
        this.categoryId,
        this.discount,
        this.unit,
        this.createdAt,
        this.orderDetailsSumQuantity,
        this.createdAtFormatted,
        this.priceAfterDiscount,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    price = (json['price'] as num?)?.toDouble();
    img = json['img'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    discount = (json['discount'] as num?)?.toDouble();
    unit = json['unit'];
    createdAt = json['created_at'];
    orderDetailsSumQuantity = json['order_details_sum_quantity'];
    createdAtFormatted = json['created_at_formatted'];
    priceAfterDiscount = (json['price_after_discount'] as num?)?.toDouble();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['price'] = this.price;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    data['category_id'] = this.categoryId;
    data['discount'] = this.discount;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['order_details_sum_quantity'] = this.orderDetailsSumQuantity;
    data['created_at_formatted'] = this.createdAtFormatted;
    data['price_after_discount'] = this.priceAfterDiscount;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? nameEn;
  String? img;
  Null? parent;

  Category({this.id, this.name, this.nameEn, this.img, this.parent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    img = json['img'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['img'] = this.img;
    data['parent'] = this.parent;
    return data;
  }
}