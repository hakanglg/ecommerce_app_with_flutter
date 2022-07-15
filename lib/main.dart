import 'package:ecommerce_app_with_flutter/feature/home/service/home_service.dart';
import 'package:ecommerce_app_with_flutter/feature/home/view_model/home_provider.dart';
import 'package:ecommerce_app_with_flutter/feature/products/service/products_service.dart';
import 'package:ecommerce_app_with_flutter/feature/products/view_model/producs_provider.dart';
import 'package:ecommerce_app_with_flutter/product/manager/shop_manager.dart';
import 'package:ecommerce_app_with_flutter/product/service/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/constants/app/applications_constants.dart';
import 'core/init/light_theme.dart';
import 'feature/single_category/service/single_category_service.dart';
import 'feature/single_category/view_ model/single_category_provider.dart';
import 'product/navigator/navigator_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) =>
              ProductsProvider(ProductsService(ProjectDioMixin().service))),
      ChangeNotifierProvider(
          create: (context) =>
              HomeProvider(HomeService(ProjectDioMixin().service))),
      ChangeNotifierProvider(
          create: (context) => SingleCategoryProvider(
              SingleCategoryService(ProjectDioMixin().service), null)),
      ChangeNotifierProvider(
        create: (context) => ShopManager(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ApplicationConstants.APP_NAME,
            theme: lightTheme,
            initialRoute: "/",
            routes: NavigatorRoutes().items,
          );
        });
  }
}
