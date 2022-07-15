import 'package:ecommerce_app_with_flutter/product/manager/shop_manager.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/constants/image/image_enum.dart';

class DefaultSliverAppBar extends StatelessWidget with BaseState {
  DefaultSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.dynamicHeight(.2),
      floating: true,
      pinned: true,
      centerTitle: true,
      backgroundColor: colorConstants.black,
      actions: [
        context.watch<ShopManager>().totalMoney == 0
            ? Container()
            : Chip(
                visualDensity: VisualDensity.standard,
                backgroundColor: colorConstants.black,
                avatar: const Icon(Icons.shopping_basket_rounded),
                label: Text(
                  context.watch<ShopManager>().totalMoney.toString(),
                  style: context.textTheme.headline3!.copyWith(
                    color: colorConstants.white,
                  ),
                )),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          ImageItems.ProductBackground.imagePathPng,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
