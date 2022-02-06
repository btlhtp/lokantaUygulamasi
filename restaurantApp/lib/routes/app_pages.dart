import 'package:get/get.dart';
import 'package:restaurantapp/presentation/products/products_view.dart';
import 'package:restaurantapp/presentation/shoppingcard/shopping_view.dart';

import 'app_routes.dart';

class AppPages {

  static var list = [
    GetPage(
      name: AppRoutes.PRODUCTPAGE,
      page: () => ProductPage(),

    ),
    GetPage(
      name: AppRoutes.SHOPPINGPAGE,
      page: () => ShoppingPage(),

    ),


  ];
}