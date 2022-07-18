import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  List<Data>? data;
  int? status;
  String? message;

  CategoryModel({this.data, this.status, this.message});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  List<String>? products;
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

