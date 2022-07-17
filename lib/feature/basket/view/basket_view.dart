import 'package:ecommerce_app_with_flutter/core/components/column/my_column.dart';
import 'package:ecommerce_app_with_flutter/core/components/row/my_row.dart';
import 'package:ecommerce_app_with_flutter/core/manager/navigation_manager.dart';
import 'package:ecommerce_app_with_flutter/product/manager/shop_manager.dart';
import 'package:ecommerce_app_with_flutter/product/widgets/card/basket_product_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView>
    with BaseState, NavigatorManager {
  final String appBarTitle = "My Products";
  final String dummyCheckout = "Checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarSection(context),
      body: MyRow(
        child: MyColumn(
          child: Column(
            children: [
              Expanded(flex: 9, child: _BasketListViewBuilder(context)),
              Expanded(child: _totalMoneyTextSection(context)),
              Expanded(child: _dummyCheckoutButton(context)),
            ],
          ),
        ),
      ),
    );
  }

  ListView _BasketListViewBuilder(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<ShopManager>().filteredListItems.length,
        itemBuilder: ((context, index) => BasketProductCard(
              model: context.watch<ShopManager>().filteredListItems[index],
            )));
  }

  OutlinedButton _dummyCheckoutButton(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Text(
          dummyCheckout,
          style: context.textTheme.bodyText2!
              .copyWith(color: colorConstants.primary),
        ));
  }

  Text _totalMoneyTextSection(BuildContext context) {
    return Text("Total: ${context.watch<ShopManager>().totalMoney}");
  }

  AppBar _appBarSection(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(appBarTitle),
      leading: IconButton(
          onPressed: () => navigateToBack(context),
          icon: Icon(
            Icons.chevron_left,
            color: colorConstants.black,
          )),
    );
  }
}