import 'package:flutter/material.dart';

import '../../feature/products/model/store_model.dart';

class ShopManager extends ChangeNotifier {
  List<Products?> shopListItems = [];

  double totalMoney = 0;

  int? currentCount(Products? model) {
    return model?.count;
  }

  void sumTotalMoney() {
    totalMoney = shopListItems.fold(
        0, (previousValue, element) => previousValue + element!.price!);
    print(totalMoney);
    notifyListeners();
  }

  void addShopItem(Products? model) {
    model?.count++;
    shopListItems.add(model);
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

  // void incrementItem(Products? model) {
  //   // if (!shopListItems.contains(model)) {
  //   // } else {
  //   //   shopListItems
  //   //       .singleWhere((element) => element?.sId == model?.sId)
  //   //       ?.count++;
  //   //   sumTotalMoney();
  //   // }
  //   Logger().wtf(model?.count.toString());
  //   // shopListItems.singleWhere((element) => element?.sId == model?.sId)?.count++;
  //   // sumTotalMoney();
  //   notifyListeners();
  // }

  // void deIncrementItem(Products? model) {
  //   if (!shopListItems.contains(model)) {
  //     Logger().wtf("ShopManager: deIncrementItem: model not found");
  //   } else {
  //     shopListItems
  //         .singleWhere((element) => element!.sId == model?.sId)
  //         ?.count--;
  //     sumTotalMoney();
  //   }
  //   notifyListeners();
  // }
}
