import 'package:flutter/widgets.dart';

import '../model/category_model.dart';
import '../service/home_service.dart';

class HomeProvider extends ChangeNotifier {
  final IHomeService homeService;

  List<Data> categoryResources = [];
  bool isLoading = false;

  HomeProvider(this.homeService) {
    _fetch();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    categoryResources = (await homeService.fetchCategoryItem())?.data ?? [];
    _changeLoading();
  }
}
