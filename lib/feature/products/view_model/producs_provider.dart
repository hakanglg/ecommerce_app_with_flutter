import '../service/products_service.dart';
import 'package:flutter/widgets.dart';

import '../../home/model/store_model.dart';

class ProductsProvider extends ChangeNotifier {
  final IProductsService productsService;

  List<Data> productResources = [];
  bool isLoading = false;

  ProductsProvider(this.productsService) {
    _fetch();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    productResources = (await productsService.fetchAllItem())?.data ?? [];
    _changeLoading();
  }
}
