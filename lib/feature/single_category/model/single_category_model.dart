import 'package:json_annotation/json_annotation.dart';

part 'single_category_model.g.dart';

@JsonSerializable()
class SingleCategoryModel {
  Data? data;
  int? status;
  String? message;

  SingleCategoryModel({this.data, this.status, this.message});

  factory SingleCategoryModel.fromJson(Map<String, dynamic> json) {
    return _$SingleCategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SingleCategoryModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  List<Products>? products;
  String? sId;
  String? name;
  String? slug;

  Data({this.products, this.sId, this.name, this.slug});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Products {
  String? sId;
  String? title;
  int? price;
  String? description;
  String? imageSource;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? slug;

  Products(
      {this.sId,
      this.title,
      this.price,
      this.description,
      this.imageSource,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.slug});

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }
}
