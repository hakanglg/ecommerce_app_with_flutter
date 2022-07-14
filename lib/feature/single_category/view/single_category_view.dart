import '../../home/service/home_service.dart';
import '../../home/view_model/home_provider.dart';
import '../service/single_category_service.dart';
import '../../../product/service/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_ model/single_category_provider.dart';

class SingleCategoryView extends StatefulWidget {
  const SingleCategoryView({Key? key}) : super(key: key);

  @override
  State<SingleCategoryView> createState() => _SingleCategoryViewState();
}

class _SingleCategoryViewState extends State<SingleCategoryView>
    with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  SingleCategoryProvider(SingleCategoryService(service))),
          ChangeNotifierProvider(
              create: (context) => HomeProvider(HomeService(service)))
        ],
        child: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                    title: Text(context
                        .watch<SingleCategoryProvider>()
                        .productResources[index]
                        .title
                        .toString()),
                  ),
              itemCount: context
                  .watch<SingleCategoryProvider>()
                  .productResources
                  .length),
        ));
  }
}
