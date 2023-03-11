import 'package:delivery_ecommerce/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/data/repository/popular_product_repo.dart';
import 'package:delivery_ecommerce/models/product_model.dart';
import 'package:delivery_ecommerce/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList; // WHATS
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print('Got products');
      _popularProductList = []; // WHATS
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print('[items count]: $_quantity');
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print('[decrement]: $_quantity');
    }

    update(); // Refresh state
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Cantidad de productos", "¡No puedes reducir más!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      if (_inCartItems > 0) {
        _quantity = -inCartItems;
        return _quantity;
      }

      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Cantidad de productos", "¡No puedes agregar más!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existIncart(product);
    print('exist or not: $exist');
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('[Quantity] in the car is: $_inCartItems');
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print('[ID] is: ${value.id}, [Quantity] is: ${value.quantity}');
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
