// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleCategoryModel _$SingleCategoryModelFromJson(Map<String, dynamic> json) =>
    SingleCategoryModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SingleCategoryModelToJson(
        SingleCategoryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'products': instance.products,
      'sId': instance.sId,
      'name': instance.name,
      'slug': instance.slug,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      sId: json['sId'] as String?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      imageSource: json['imageSource'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'imageSource': instance.imageSource,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
    };
