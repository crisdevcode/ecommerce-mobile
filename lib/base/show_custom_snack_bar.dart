import 'package:delivery_ecommerce/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// WHATS: When is Widget type or a simple function? 
void showCustomSnackBar(
  String message, { bool isError = true, String title = 'Error' }) {

    Get.snackbar(
      title, 
      message, 
      titleText: BigText(text: title, color: Colors.white),
      messageText: Text(message, style: const TextStyle(
        color: Colors.white
      )),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent
    );
}