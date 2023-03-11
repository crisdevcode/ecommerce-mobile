import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/data/api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({ required this.apiClient });

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI); // Slash only at the beginning. No slash at the end.
  }
}