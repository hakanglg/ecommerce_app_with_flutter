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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Products &&
        other.sId == sId &&
        other.title == title &&
        other.price == price &&
        other.category == category &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.slug == slug &&
        other.image == image &&
        other.count == count;
  }

  @override
  int get hashCode {
    return sId.hashCode ^
        title.hashCode ^
        price.hashCode ^
        category.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        slug.hashCode ^
        image.hashCode ^
        count.hashCode;
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
