
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/data/repository/popular_product_repo.dart';
import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/data/api/api_client.dart';

Future<void> init() async {
  // Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL)); // No slash at the end.

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // WHATS

  // Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}