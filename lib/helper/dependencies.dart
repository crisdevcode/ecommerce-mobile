
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/controllers/recommended_product_controller.dart';
import 'package:delivery_ecommerce/data/repository/popular_product_repo.dart';
import 'package:delivery_ecommerce/data/repository/recommended_product_repo.dart';
import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/data/api/api_client.dart';

Future<void> init() async {
  // Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL)); // No slash at the end.

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // WHATS
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find())); 

  // Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));

}