import 'package:get/get.dart';
import 'package:delivery_ecommerce/pages/auth/sign_in_page.dart';
import 'package:delivery_ecommerce/pages/cart/cart_page.dart';
import 'package:delivery_ecommerce/pages/food/recommended_food_detail.dart';
import 'package:delivery_ecommerce/pages/home/home_page.dart';
import 'package:delivery_ecommerce/pages/splash/splash_page.dart';
import 'package:delivery_ecommerce/pages/food/popular_food_detail.dart';

class RouteHelper {
  // Routes
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";

  // Getters
  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;
  static String getSignInPage() => signIn;

  static List<GetPage> routes = [
    GetPage(
      name: splashPage, 
      page: () => const SplashPage()
    ),

    GetPage(
      name: initial, 
      page: () => const HomePage()
    ),

    GetPage(
      name: signIn, 
      page: () => const SignInPage(), 
      transition: Transition.fade
    ),
    
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];

        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          page: page!
        ); // print('Popular food get called');
      },
      transition: Transition.fadeIn
    ),

    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!
        ); // print('Popular food get called');
      },
      transition: Transition.fadeIn
    ),

    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.fadeIn
    )
  ];
}
