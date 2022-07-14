import '../../../core/components/column/my_column.dart';
import '../../../core/components/row/my_row.dart';
import '../../home/service/home_service.dart';
import '../../home/view_model/home_provider.dart';
import '../../../product/widgets/drawer/categories_drawer.dart';
import '../../../product/widgets/lottie/circular_loading_lottie.dart';
import '../../../product/widgets/sliver_appbar/default_sliver_appbar.dart';
import '../service/products_service.dart';
import '../view_model/producs_provider.dart';
import '../../../product/service/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/widgets/grid_builder/product_grid_builder.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProductsProvider(ProductsService(
                  service,
                ))),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(HomeService(
                  service,
                )))
      ],
      builder: (context, child) => Scaffold(
        drawer: CategoriesDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  DefaultSliverAppBar(),
                ],
            body: context.watch<ProductsProvider>().isLoading
                ? const CircularLoadingLottie()
                : _CompleteSection(context)),
      ),
    );
  }

  MyColumn _CompleteSection(BuildContext context) {
    return MyColumn(
        child: MyRow(
            child: ProductGridViewBuilder(
                itemCount:
                    context.watch<ProductsProvider>().productResources.length,
                model: context.watch<ProductsProvider>().productResources)));
  }

  Center _test(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
                title: Text(context
                    .watch<ProductsProvider>()
                    .productResources[index]
                    .title
                    .toString()),
              ),
          itemCount: context.watch<ProductsProvider>().productResources.length),
    );
  }
}
