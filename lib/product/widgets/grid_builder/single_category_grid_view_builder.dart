// import '../../../feature/single_category/model/single_category_model.dart';
// import '../card/product_card.dart';
// import 'package:flutter/material.dart';

// import '../../../core/base/base_state.dart';

// class SingleCategoryGridViewBuilder extends StatelessWidget with BaseState {
//   SingleCategoryGridViewBuilder({
//     super.key,
//     required this.itemCount,
//     required this.model,
//   });

//   final int itemCount;
//   final Data model;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         shrinkWrap: false,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 20,
//           crossAxisSpacing: 20,
//           childAspectRatio: 1,
//         ),
//         itemCount: itemCount,
//         itemBuilder: (context, index) =>
//             ProductCard(model: model.products?[index]));
//   }
// }

// // GridView.builder(
// //         shrinkWrap: false,
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           mainAxisSpacing: 20,
// //           crossAxisSpacing: 20,
// //           childAspectRatio: 1,
// //         ),
// //         itemCount: viewmodel.productResources.length,
// //         itemBuilder: (context, index) => ProductCard(
// //           model: viewmodel.productResources[index],
// //         ));