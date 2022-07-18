import 'package:ecommerce_app_with_flutter/product/manager/shop_manager.dart';
import 'package:ecommerce_app_with_flutter/product/widgets/image/dummy_product_image.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../feature/products/model/store_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, this.model}) : super(key: key);
  final Products? model;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with BaseState {
  late Products? model;

  bool _isZero = true;

  void change_IsZero() {
    setState(() {
      _isZero = !_isZero;
    });
  }

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            flex: 3,
            child: DummyProductImage(),
          ),
          Expanded(
            child: _productTitleSection(context),
          ),
          context.emptySizedHeightBoxLow,
          _dummyReviews,
          Expanded(
            child: _productPriceAndAddBagSection(context),
          )
        ],
      ),
      _incrementAndDecrementButton(context),
    ]);
  }

  Positioned _incrementAndDecrementButton(BuildContext context) {
    return Positioned(
      right: 0,
      child: AnimatedContainer(
        duration: context.durationLow,
        height: _isZero ? 0 : context.dynamicHeight(0.13),
        width: _isZero ? 0 : context.dynamicWidth(.12),
        child: Card(
          color: colorConstants.primary,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: _incrementButton(context),
              ),
              Expanded(child: _itemCountText(context)),
              Expanded(
                flex: 2,
                child: _decrementButton(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  IconButton _incrementButton(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<ShopManager>().addShopItem(model),
        icon: Icon(_isZero ? null : Icons.add));
  }

  Text _itemCountText(BuildContext context) {
    return Text(
      context.watch<ShopManager>().currentCount(model).toString(),
      style: context.textTheme.bodyText2!.copyWith(color: colorConstants.white),
    );
  }

  IconButton _decrementButton(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<ShopManager>().removeShopItem(model),
        icon: Icon(_isZero ? null : Icons.remove));
  }

  Row _productPriceAndAddBagSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [_productPrice(context), _addBag()],
    );
  }

  ListTile _productTitleSection(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
          maxLines: 1,
          (model?.title.toTitleCase().toString() ?? ""),
          style: context.textTheme.bodyText2),
    );
  }

  Text _productPrice(BuildContext context) {
    return Text(
      "${model?.price.toString()}\$",
      style:
          context.textTheme.bodyText2!.copyWith(color: colorConstants.primary),
    );
  }

  InkWell _addBag() {
    return InkWell(
      onTap: change_IsZero,
      child: CircleAvatar(
        backgroundColor: colorConstants.white,
        child: Icon(
          Icons.shopping_bag,
          color: colorConstants.success,
        ),
      ),
    );
  }

  Widget get _dummyReviews => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.star_rate_rounded,
            color: colorConstants.yellow,
          ),
          Icon(
            Icons.star_rate_rounded,
            color: colorConstants.yellow,
          ),
          Icon(
            Icons.star_rate_rounded,
            color: colorConstants.yellow,
          ),
          Icon(
            Icons.star_rate_rounded,
            color: colorConstants.yellow,
          ),
          Icon(
            Icons.star_rate_rounded,
            color: colorConstants.yellow,
          )
        ],
      );
}
