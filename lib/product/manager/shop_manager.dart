import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../feature/single_category/model/single_category_model.dart';

class ShopManager extends ChangeNotifier {
  List<Products> shopListItems = [];

  double totalMoney = 0;

  void sumTotalMoney() {
    totalMoney = shopListItems.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price! * element.count);
    print(totalMoney);
    notifyListeners();
  }

  void addShopItem(Products model) {
    model.count++;
    shopListItems.add(model);
    sumTotalMoney();
    notifyListeners();
  }

  void removeShopItem(Products model) {
    model.count--;
    shopListItems.remove(model);
    sumTotalMoney();
    notifyListeners();
  }

  void incrementItem(Products model) {
    if (!shopListItems.contains(model)) {
    } else {
      shopListItems.singleWhere((element) => element.sId == model.sId).count++;
      sumTotalMoney();
    }
    notifyListeners();
  }

  void deIncrementItem(Products model) {
    if (!shopListItems.contains(model)) {
      Logger().wtf("ShopManager: deIncrementItem: model not found");
    } else {
      shopListItems.singleWhere((element) => element.sId == model.sId).count--;
      sumTotalMoney();
    }
    notifyListeners();
  }
}
