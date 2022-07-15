import 'package:ecommerce_app_with_flutter/product/manager/shop_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.model}) : super(key: key);
  final model;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with BaseState {
  final String _dummyImageSrc =
      "https://www.nicepng.com/png/full/98-980274_clothing-clipart-nrilaot84-clipart-clothes.png";
  int _count = 0;
  bool isZero = true;

  void changeIsZero() {
    setState(() {
      isZero = !isZero;
    });
  }

  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

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
            child: _productImageSection(),
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
      _incrementAndDeicrementButton(context),
    ]);
  }

  Positioned _incrementAndDeicrementButton(BuildContext context) {
    return Positioned(
      right: 0,
      child: AnimatedContainer(
        duration: context.durationLow,
        height: isZero ? 0 : context.dynamicHeight(0.13),
        width: isZero ? 0 : context.dynamicWidth(.12),
        child: Card(
          color: colorConstants.primary,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: IconButton(
                    onPressed: () =>
                        context.read<ShopManager>().incrementItem(widget.model),
                    icon: Icon(isZero ? null : Icons.add)),
              ),
              Expanded(
                  child: Text(
                _count.toString(),
                style: context.textTheme.bodyText2!
                    .copyWith(color: colorConstants.white),
              )),
              Expanded(
                flex: 2,
                child: IconButton(
                    onPressed: () => context
                        .read<ShopManager>()
                        .deIncrementItem(widget.model),
                    icon: Icon(isZero ? null : Icons.remove)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _productPriceAndAddBagSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [_productPrice(context), _addBag()],
    );
  }

  Image _productImageSection() {
    return Image.network(
      _dummyImageSrc,
      fit: BoxFit.cover,
    );
  }

  ListTile _productTitleSection(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
          maxLines: 1,
          (widget.model.title?.toString().toTitleCase() ?? ""),
          style: context.textTheme.bodyText2),
    );
  }

  Text _productPrice(BuildContext context) {
    return Text(
      "${widget.model.price?.toString().toTitleCase() ?? ""}\$",
      style:
          context.textTheme.bodyText2!.copyWith(color: colorConstants.primary),
    );
  }

  InkWell _addBag() {
    return InkWell(
      onTap: changeIsZero,
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
