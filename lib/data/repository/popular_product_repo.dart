import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({ required this.apiClient });

  Future<Response> getPopularProductList() async {
    // /api/v1/products
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI); // Slash only at the beginning. No slash at the end.
  }
}
