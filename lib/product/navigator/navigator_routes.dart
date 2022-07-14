import '../../feature/products/view/products_view.dart';

import '../../feature/home/view/home_view.dart';
import '../../feature/single_category/view/single_category_view.dart';

class NavigatorRoutes {
  static const slash = "/";
  final items = {
    slash: (context) => HomeView(),
    NavigateRoutes.single.withSlash: ((context) => const SingleCategoryView()),
    NavigateRoutes.products.withSlash: ((context) => const ProductsView()),
  };
}

enum NavigateRoutes { single, products }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withSlash => "/$name";
}
