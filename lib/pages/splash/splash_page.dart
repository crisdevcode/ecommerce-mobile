import 'dart:async';

import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/controllers/recommended_product_controller.dart';
import 'package:delivery_ecommerce/routes/route_helper.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  // WHATS

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async { // WHATS WTF :( <---
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () => Get.offNamed(RouteHelper.initial));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: App logo image
          ScaleTransition(
            scale: animation,
            child: Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: Dimensions.splashImg,
            )),
          ),
          // TODO: App name text
          // Center(
          //   child: Image.asset("assets/images/logo-text.png", width: Dimensions.splashImg)
          // ),
        ],
      ),
    );
  }
}
