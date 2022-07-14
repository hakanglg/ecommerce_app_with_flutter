import 'dart:io';
import 'package:dio/dio.dart';
import '../model/store_model.dart';

abstract class IHomeService {
  IHomeService(
    this.dio,
  );

  final Dio dio;

  Future<StoreModel?> fetchCategoryItem();
}

enum _HomePath { categories }

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  Future<StoreModel?> fetchCategoryItem() async {
    final response = await dio.get("/${_HomePath.categories.name}");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return StoreModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
