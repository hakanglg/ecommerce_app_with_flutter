import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  List<Products>? data;
  int? status;
  String? message;

  StoreModel({this.data, this.status, this.message});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return _$StoreModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreModelToJson(this);
  }
}

@JsonSerializable()
class Products {
  String? sId;
  String? title;
  int? price;
  Category? category;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? image;

  Products(
      {this.sId,
      this.title,
      this.price,
      this.category,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.image});

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }
}

@JsonSerializable()
class Category {
  String? sId;
  String? name;
  String? slug;

  Category({this.sId, this.name, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryToJson(this);
  }
}