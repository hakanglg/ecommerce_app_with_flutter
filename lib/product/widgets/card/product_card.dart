import 'package:ecommerce_app_with_flutter/product/manager/shop_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/image/image_enum.dart';
import '../../../feature/products/model/store_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, this.model}) : super(key: key);
  final Products? model;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with BaseState {
  final String _dummyImageSrc =
      "https://m.media-amazon.com/images/I/B1qmQK-r4OS._CLa%7C2140%2C2000%7C61KAP4wDG-L.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_UX466_.png";

  bool _isZero = true;

  void change_IsZero() {
    setState(() {
      _isZero = !_isZero;
    });
  }

  Widget get _dummyProductImage => Image.asset(
        ImageItems.DummyProductImage.imagePathPng,
        fit: BoxFit.cover,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: _dummyProductImage,
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
        onPressed: () => context.read<ShopManager>().addShopItem(widget.model),
        icon: Icon(_isZero ? null : Icons.add));
  }

  Text _itemCountText(BuildContext context) {
    return Text(
      context.watch<ShopManager>().currentCount(widget.model).toString(),
      style: context.textTheme.bodyText2!.copyWith(color: colorConstants.white),
    );
  }

  IconButton _decrementButton(BuildContext context) {
    return IconButton(
        onPressed: () =>
            context.read<ShopManager>().removeShopItem(widget.model),
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
          (widget.model?.title.toTitleCase().toString() ?? ""),
          style: context.textTheme.bodyText2),
    );
  }

  Text _productPrice(BuildContext context) {
    return Text(
      "${widget.model?.price.toString()}\$",
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
