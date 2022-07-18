import 'dart:io';

import 'package:dio/dio.dart';

import '../model/category_model.dart';

abstract class IHomeService {
  IHomeService(
    this.dio,
  );

  final Dio dio;

  Future<CategoryModel?> fetchCategoryItem();
}

enum _HomePath { categories }

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  Future<CategoryModel?> fetchCategoryItem() async {
    final response = await dio.get("/${_HomePath.categories.name}");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return CategoryModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
