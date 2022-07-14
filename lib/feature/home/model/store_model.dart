import 'package:json_annotation/json_annotation.dart';
part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  List<Data>? data;
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
class Data {
  List<String>? products;
  String? sId;
  String? name;
  String? slug;
  String? title;
  int? price;
  Category? category;
  String? description;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;
  String? image;

  Data({this.products, this.sId, this.name, this.slug});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
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

@JsonSerializable()
class CreatedBy {
  String? role;
  String? sId;
  String? name;

  CreatedBy({this.role, this.sId, this.name});

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return _$CreatedByFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreatedByToJson(this);
  }
}
