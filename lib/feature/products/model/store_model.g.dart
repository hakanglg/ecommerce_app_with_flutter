// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      sId: json['sId'] as String?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      'image': instance.image,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'slug': instance.slug,
    };
