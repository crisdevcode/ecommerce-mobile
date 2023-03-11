import 'package:delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/pages/home/food_page_body.dart';

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
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainFoodPage());
  }
}
