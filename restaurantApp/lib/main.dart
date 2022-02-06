import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/model/cart_provider.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      return GetMaterialApp(
        initialRoute: AppRoutes.PRODUCTPAGE,
        getPages: AppPages.list,
        debugShowCheckedModeBanner: false,
    );
  }
}



