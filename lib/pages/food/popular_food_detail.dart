import 'package:delivery_ecommerce/controllers/cart_controller.dart';
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:delivery_ecommerce/routes/route_helper.dart';
import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:delivery_ecommerce/widgets/app_column.dart';
import 'package:delivery_ecommerce/widgets/app_icon.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';
import 'package:delivery_ecommerce/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;

  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    // WHATS
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // print('page id is: ${pageId.toString()}');
    // print('product name is is: ${product.name.toString()}');

    // Reset count
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>()); // WHATS

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img))),
              ),
            ),
            // Icons - Back button and shopping cart
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        const AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1 
                          ? 
                          const Positioned( // WHATS
                            right: 0,
                            top: 0,
                            child: AppIcon(icon: Icons.circle, size: 20, 
                            iconColor: Colors.transparent, 
                            backgroundColor: AppColors.mainColor)) 
                          : 
                          Container(),
                          Get.find<PopularProductController>().totalItems >= 1 
                          ? 
                          Positioned(
                            right: 3,
                            top: 3,
                            child: BigText(
                              text: '${Get.find<PopularProductController>().totalItems}',
                              size: 12,
                              color: Colors.white)
                          ) 
                          : 
                          Container()
                      ],
                    );
                  })
                ],
              ),
            ),
            // Description food box
            Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize - 20,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name),
                      SizedBox(height: Dimensions.height20),
                      BigText(text: "Descripción"),
                      // Expandable text widget
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                        child: SingleChildScrollView(
                          child:
                              ExpandableTextWidget(text: product.description),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            // height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: const Icon(Icons.remove,
                              color: AppColors.signColor)),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child:
                              const Icon(Icons.add, color: AppColors.signColor))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: BigText(
                        text: "\$ ${product.price} | Agregar",
                        color: Colors.white),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
