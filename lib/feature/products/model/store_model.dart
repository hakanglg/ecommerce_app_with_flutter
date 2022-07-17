import 'package:json_annotation/json_annotation.dart';

import '../../home/model/category_model.dart';

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

  @JsonKey(ignore: true)
  int count = 0;

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
