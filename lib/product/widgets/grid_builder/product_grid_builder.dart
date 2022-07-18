import 'package:flutter/material.dart';

import '../../../core/base/base_state.dart';
import '../../../feature/products/model/store_model.dart';
import '../card/product_card.dart';

// ignore: must_be_immutable
class ProductGridViewBuilder extends StatelessWidget with BaseState {
  ProductGridViewBuilder({
    super.key,
    required this.itemCount,
    required this.model,
  });

  final int itemCount;
  final List<Products?> model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) => ProductCard(model: model[index]));
  }
}

// GridView.builder(
//         shrinkWrap: false,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 20,
//           crossAxisSpacing: 20,
//           childAspectRatio: 1,
//         ),
//         itemCount: viewmodel.productResources.length,
//         itemBuilder: (context, index) => ProductCard(
//           model: viewmodel.productResources[index],
//         ));