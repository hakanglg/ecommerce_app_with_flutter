import '../../../product/widgets/lottie/circular_loading_lottie.dart';
import '../../../core/components/column/my_column.dart';
import '../../../core/components/row/my_row.dart';
import '../../../product/service/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/widgets/grid_builder/product_grid_builder.dart';
import '../../../product/widgets/sliver_appbar/default_sliver_appbar.dart';
import '../view_ model/single_category_provider.dart';

class SingleCategoryView extends StatefulWidget {
  const SingleCategoryView({
    Key? key,
    this.slug,
  }) : super(key: key);
  final String? slug;
  @override
  State<SingleCategoryView> createState() => _SingleCategoryViewState();
}

class _SingleCategoryViewState extends State<SingleCategoryView>
    with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SingleCategoryProvider>().fetch(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        DefaultSliverAppBar(),
      ],
      body: context.watch<SingleCategoryProvider>().isLoading
          ? const CircularLoadingLottie()
          : _completedSection(context),
    ));
  }

  MyColumn _completedSection(BuildContext context) {
    return MyColumn(
        child: MyRow(
            child: ProductGridViewBuilder(
                itemCount: context
                    .watch<SingleCategoryProvider>()
                    .productResources
                    .length,
                model:
                    context.watch<SingleCategoryProvider>().productResources)));
  }
}
