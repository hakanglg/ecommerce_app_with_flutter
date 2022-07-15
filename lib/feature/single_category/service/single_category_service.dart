import 'dart:io';

import 'package:dio/dio.dart';

import '../model/single_category_model.dart';

abstract class ISingleCategoryService {
  ISingleCategoryService(
    this.dio,
  );

  final Dio dio;

  Future<SingleCategoryModel?> fetchSingleCategoryItems(String slug);
}

enum _ProductsPath { categories }

class SingleCategoryService extends ISingleCategoryService {
  SingleCategoryService(super.dio);

  @override
  Future<SingleCategoryModel?> fetchSingleCategoryItems(String slug) async {
    final response = await dio.get("/${_ProductsPath.categories.name}/$slug");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return SingleCategoryModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
