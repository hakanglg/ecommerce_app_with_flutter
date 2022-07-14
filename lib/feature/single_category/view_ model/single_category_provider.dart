import '../model/single_category_model.dart';
import 'package:flutter/widgets.dart';
import '../service/single_category_service.dart';

class SingleCategoryProvider extends ChangeNotifier {
  final ISingleCategoryService singleCategoryService;

  List<Products> productResources = [];
  bool isLoading = false;

  SingleCategoryProvider(this.singleCategoryService) {
    _fetch();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    productResources = (await singleCategoryService.fetchSingleCategoryItems())
            ?.data
            ?.products ??
        [];
    _changeLoading();
  }
}
