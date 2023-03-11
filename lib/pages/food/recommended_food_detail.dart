import 'package:delivery_ecommerce/controllers/cart_controller.dart';
import 'package:delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:delivery_ecommerce/controllers/recommended_product_controller.dart';
import 'package:delivery_ecommerce/pages/cart/cart_page.dart';
import 'package:delivery_ecommerce/routes/route_helper.dart';
import 'package:delivery_ecommerce/utils/app_constants.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:delivery_ecommerce/widgets/app_icon.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';
import 'package:delivery_ecommerce/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          // WHATS
          slivers: [
            SliverAppBar(
              // WHATS
              automaticallyImplyLeading: false, // WHATS
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: const AppIcon(icon: Icons.clear)),
                  //const AppIcon(icon: Icons.shopping_cart_outlined)
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        const AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CartPage());
                                  },
                                  child: const AppIcon(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: AppColors.mainColor),
                                ))
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(
                                    text:
                                        '${Get.find<PopularProductController>().totalItems}',
                                    size: 12,
                                    color: Colors.white))
                            : Container()
                      ],
                    );
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  child: Center(
                      child:
                          BigText(text: product.name, size: Dimensions.font26)),
                ),
              ),
              pinned: true, // WHATS
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  // WHATS
                  background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
                // WHATS
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: product.description),
                )
              ],
            ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min, // WHATS
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20 * 2.5,
                    right: Dimensions.width20 * 2.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                          iconSize: Dimensions.iconSize24,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          icon: Icons.remove),
                    ),
                    BigText(
                      text: "\$ ${product.price} x ${controller.inCartItems}",
                      color: AppColors.mainBlackColor,
                      size: Dimensions.font26,
                    ),
                    // Remove Button
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                          iconSize: Dimensions.iconSize24,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          icon: Icons.add),
                    )
                  ],
                ),
              ),
              Container(
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
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white),
                        child: const Icon(Icons.favorite,
                            color: AppColors.mainColor)),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor),
                        child: BigText(
                            text: "\$${product.price} | Agregar",
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
