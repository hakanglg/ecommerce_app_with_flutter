import '../../../feature/home/service/home_service.dart';
import '../../../feature/single_category/service/single_category_service.dart';
import '../../../feature/single_category/view_ model/single_category_provider.dart';
import '../../service/project_dio.dart';
import '../lottie/circular_loading_lottie.dart';

import '../../../feature/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../list_tile/drawer_list_tile.dart';

class CategoriesDrawer extends StatelessWidget with ProjectDioMixin {
  CategoriesDrawer({
    Key? key,
  }) : super(key: key);

  final String categoriesText = "Categories";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => HomeProvider(HomeService(service))),
          ChangeNotifierProvider(
              create: (context) =>
                  SingleCategoryProvider(SingleCategoryService(service)))
        ],
        builder: (context, child) => Drawer(
              child: context.watch<HomeProvider>().isLoading
                  ? const CircularLoadingLottie()
                  : Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: DrawerHeader(
                              child: Text(
                            categoriesText,
                            style: context.textTheme.headline3,
                          )),
                        ),
                        Expanded(
                          flex: 8,
                          child: ListView.builder(
                            itemCount: context
                                .watch<HomeProvider>()
                                .categoryResources
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return DrawerListTile(
                                model: context
                                    .watch<HomeProvider>()
                                    .categoryResources[index],
                              );

                              // ListTile(
                              //   onTap: () {
                              //     print("Tapped");
                              //   },
                              //   title: Text(
                              //     context
                              //         .watch<HomeProvider>()
                              //         .categoryResources[index]
                              //         .name
                              //         .toString()
                              //         .toTitleCase(),
                              //     style: context.textTheme.bodyText2,
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
            ));
  }
}
