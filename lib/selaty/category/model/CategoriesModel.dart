class CategoriesModel {
  bool? status;
  String? message;
  PaginationData? data;

  CategoriesModel({this.status, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  int? currentPage;
  List<ProductData>? data;
  int? lastPage;
  String? nextPageUrl;

  PaginationData({this.currentPage, this.data, this.lastPage, this.nextPageUrl});

  PaginationData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }
}

class ProductData {
  int? id;
  String? name;
  String? nameEn;
  String? details;
  String? detailsEn;
  String? price;
  int? quantity;

  ProductData({
    this.id,
    this.name,
    this.nameEn,
    this.details,
    this.detailsEn,
    this.price,
    this.quantity,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    details = json['details'];
    detailsEn = json['details_en'];
    price = json['price'];
    quantity = json['quantity'];
  }
}
