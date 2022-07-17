import 'package:flutter/material.dart';

import '../../feature/products/model/store_model.dart';

class ShopManager extends ChangeNotifier {
  List<Products?> shopListItems = [];

  double totalMoney = 0;

  late List<Products?> filteredListItems = shopListItems.toSet().toList();

  int? currentCount(Products? model) {
    return model?.count;
  }

  int? sumCount(Products? model) {
    return model!.count * model.price!;
  }

  void sumTotalMoney() {
    totalMoney = shopListItems.fold(
        0, (previousValue, element) => previousValue + element!.price!);
    print(totalMoney);
    notifyListeners();
  }

  void addShopItem(Products? model) {
    shopListItems.add(model);
    model?.count++;
    sumTotalMoney();
    notifyListeners();
  }

  void removeShopItem(Products? model) {
    if (model?.count == 0) return;
    model?.count--;
    shopListItems.remove(model);
    sumTotalMoney();
    notifyListeners();
  }
}
