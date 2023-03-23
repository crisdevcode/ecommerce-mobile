// Flutter and etX
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
// Controllers
import 'package:delivery_ecommerce/controllers/cart_controller.dart';
import 'package:delivery_ecommerce/controllers/recommended_product_controller.dart';
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
// Routes
import 'package:delivery_ecommerce/routes/route_helper.dart';
// Helpers
import 'helper/dependencies.dart' as dep;

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

    Get.find<CartController>().getCartData();
    
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SignInPage(), // Testing Page
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          theme: ThemeData(
            primaryColor:  AppColors.mainColor,
            fontFamily: 'Lato', //* Change this if this not works.
          )
        );
      });
    });
  }
}