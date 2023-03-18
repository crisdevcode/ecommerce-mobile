import 'package:delivery_ecommerce/controllers/auth_controller.dart';
import 'package:delivery_ecommerce/controllers/cart_controller.dart';
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/controllers/recommended_product_controller.dart';
import 'package:delivery_ecommerce/data/repository/auth_repo.dart';
import 'package:delivery_ecommerce/data/repository/cart_repo.dart';
import 'package:delivery_ecommerce/data/repository/popular_product_repo.dart';
import 'package:delivery_ecommerce/data/repository/recommended_product_repo.dart';
import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

// WHATS Get.lazyPut() ?
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL)); // No slash at the end.
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find())); // No slash at the end.

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // WHATS
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
