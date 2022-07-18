import 'package:ecommerce_app_with_flutter/feature/products/view_model/producs_provider.dart';
import 'package:ecommerce_app_with_flutter/product/widgets/image/dummy_product_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

import '../../../feature/products/model/store_model.dart';

class SearchBar extends StatelessWidget {
  final String _searchText = 'Search product';
  final String _filterInfo = 'Filter product by name';
  final String _noProduct = 'No product found :(';

  @override
  Widget build(BuildContext context) {
    List<Products> product = context.watch<ProductsProvider>().productResources;
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () => showSearch(
        context: context,
        delegate: SearchPage<Products>(
          onQueryUpdate: (s) => print(s),
          items: product,
          searchLabel: _searchText,
          barTheme: ThemeData(useMaterial3: true),
          suggestion: _filterInfoMessage(context),
          failure: _noProductSection(context),
          filter: (person) => [
            person.title,
          ],
          builder: (person) => _productListTile(person, context),
        ),
      ),
    );
  }

  Center _filterInfoMessage(BuildContext context) {
    return Center(
      child: Text(_filterInfo, style: context.textTheme.bodyText2),
    );
  }

  Center _noProductSection(BuildContext context) {
    return Center(
      child: Text(
        _noProduct,
        style: context.textTheme.bodyText2,
      ),
    );
  }

  ListTile _productListTile(Products person, BuildContext context) {
    return ListTile(
      leading: const DummyProductImage(),
      title: Text(
        person.title.toString(),
        style: context.textTheme.bodyText2,
        maxLines: 1,
      ),
    );
  }
}
