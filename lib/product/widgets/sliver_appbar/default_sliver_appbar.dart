import '../../../core/manager/navigation_manager.dart';
import '../../../feature/basket/view/basket_view.dart';
import '../search/search_bar.dart';
import '../../manager/shop_manager.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/constants/image/image_enum.dart';
import '../../../feature/home/view/home_view.dart';

// ignore: must_be_immutable
class DefaultSliverAppBar extends StatelessWidget
    with BaseState, NavigatorManager {
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
        SearchBar(),
        _homeButton(context),
        Visibility(
          visible: context.watch<ShopManager>().totalMoney == 0 ? false : true,
          child: AnimatedContainer(
              duration: context.durationLow, child: _basketChipButton(context)),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          ImageItems.ProductBackground.imagePathPng,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  IconButton _homeButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.home),
      onPressed: () => navigateToWidget(context, HomeView()),
    );
  }

  InkWell _basketChipButton(BuildContext context) {
    return InkWell(
      onTap: () => navigateToWidget(context, const BasketView()),
      child: Chip(
          visualDensity: VisualDensity.standard,
          backgroundColor: colorConstants.black,
          avatar: const Icon(Icons.shopping_basket_rounded),
          label: Text(
            "${context.watch<ShopManager>().totalMoney.toString()} \$",
            style: context.textTheme.headline3!.copyWith(
              color: colorConstants.white,
            ),
          )),
    );
  }
}
