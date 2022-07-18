import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_state.dart';
import '../../../core/components/row/my_row.dart';
import '../../../core/constants/image/image_enum.dart';
import '../../../core/manager/navigation_manager.dart';
import '../../../product/service/project_dio.dart';
import '../../../product/widgets/drawer/categories_drawer.dart';
import '../../../product/widgets/lottie/circular_loading_lottie.dart';
import '../../products/view/products_view.dart';
import '../view_model/home_provider.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget
    with BaseState, NavigatorManager, ProjectDioMixin {
  HomeView({Key? key}) : super(key: key);

  final String subtitle = "You've never seen it before!";
  final String title = "NEW";
  final String buttonText = "View All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: CategoriesDrawer(),
        body: context.watch<HomeProvider>().isLoading
            ? const CircularLoadingLottie()
            : _completedSection(context));
  }

  Column _completedSection(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 6, child: _bgImageSection),
        Expanded(
            child: MyRow(
          child: Center(child: _BottomTextListTileSection(context)),
        ))
      ],
    );
  }

  Widget get _bgImageSection => Image.asset(
        ImageItems.HomeBackground.imagePathPng,
        fit: BoxFit.cover,
      );

  Widget _BottomTextListTileSection(BuildContext context) => ListTile(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.headline2,
            ),
            Text(
              subtitle,
              style: context.textTheme.subtitle1,
            )
          ],
        ),
        trailing: TextButton(
            onPressed: () {
              navigateToWidget(context, const ProductsView());
            },
            child: Text(
              buttonText,
              style: context.textTheme.bodyText2,
            )),
      );
}
