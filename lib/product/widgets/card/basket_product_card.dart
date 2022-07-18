import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../feature/products/model/store_model.dart';
import '../../manager/shop_manager.dart';
import '../image/dummy_product_image.dart';

class BasketProductCard extends StatefulWidget {
  const BasketProductCard({Key? key, this.model}) : super(key: key);
  final Products? model;
  @override
  State<BasketProductCard> createState() => _BasketProductCardState();
}

class _BasketProductCardState extends State<BasketProductCard> {
  @override
  Widget build(BuildContext context) {
    return widget.model?.count == 0
        ? Container()
        : Column(
            children: [
              SizedBox(
                  height: context.dynamicHeight(0.15),
                  child: Row(
                    children: [
                      const Expanded(flex: 1, child: DummyProductImage()),
                      Expanded(flex: 2, child: _productInfoSection(context))
                    ],
                  )),
              context.emptySizedHeightBoxLow3x
            ],
          );
  }

  Column _productInfoSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: _productTitle(context),
          trailing: _totalProductPrice(context),
          subtitle: _addRemoveAndCountSection(context),
        )
      ],
    );
  }

  Text _productTitle(BuildContext context) {
    return Text(widget.model?.title.toTitleCase() ?? "",
        style: context.textTheme.bodyText2, maxLines: 1);
  }

  Text _totalProductPrice(BuildContext context) {
    return Text(
      "${context.watch<ShopManager>().sumCount(widget.model)} \$",
      style: context.textTheme.bodyText2,
    );
  }

  Row _addRemoveAndCountSection(BuildContext context) {
    return Row(
      children: [
        _removeButton(context),
        _countText(context),
        _addButton(context),
      ],
    );
  }

  IconButton _removeButton(BuildContext context) {
    return IconButton(
        onPressed: () =>
            context.read<ShopManager>().removeShopItem(widget.model),
        icon: const Icon(Icons.remove));
  }

  Text _countText(BuildContext context) {
    return Text(
      widget.model?.count.toString() ?? "",
      style: context.textTheme.bodyText2,
    );
  }

  IconButton _addButton(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<ShopManager>().addShopItem(widget.model),
        icon: const Icon(Icons.add));
  }
}
