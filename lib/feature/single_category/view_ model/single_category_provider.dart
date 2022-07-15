import '../model/single_category_model.dart';
import 'package:flutter/widgets.dart';
import '../service/single_category_service.dart';

class SingleCategoryProvider extends ChangeNotifier {
  final ISingleCategoryService singleCategoryService;
  final String? slug;
  List<Products?> productResources = [];
  bool isLoading = false;

  SingleCategoryProvider(this.singleCategoryService, this.slug);

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetch(slug) async {
    _changeLoading();
    productResources =
        (await singleCategoryService.fetchSingleCategoryItems(slug))
                ?.data
                ?.products ??
            [];
    _changeLoading();
  }
}
