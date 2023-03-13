import 'package:delivery_ecommerce/controllers/recommended_product_controller.dart';
import 'package:delivery_ecommerce/pages/cart/cart_page.dart';
import 'package:delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:delivery_ecommerce/pages/splash/splash_page.dart';
import 'package:delivery_ecommerce/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // WHATS
  // Initialize dependencies
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: const SplashPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}

/**
 * Notes:
 * // home: const MainFoodPage(),
 * 
 */
