import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_with_flutter/feature/products/model/store_model.dart';

abstract class IProductsService {
  IProductsService(
    this.dio,
  );

  final Dio dio;

  Future<StoreModel?> fetchAllItem();
}

enum _ProductsPath { products }

class ProductsService extends IProductsService {
  ProductsService(super.dio);

  @override
  Future<StoreModel?> fetchAllItem() async {
    final response = await dio.get("/${_ProductsPath.products.name}");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return StoreModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
