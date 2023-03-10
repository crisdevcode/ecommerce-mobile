import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:delivery_ecommerce/widgets/app_column.dart';
import 'package:delivery_ecommerce/widgets/app_icon.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';
import 'package:delivery_ecommerce/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration:  const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://images.unsplash.com/photo-1633383718081-22ac93e3db65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1058&q=80')
                )
              ),
            ),
          ),
          // Icons - Back button and shopping cart
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
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
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Buona Pizza"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Descripción"),
                  // Expandable text widget
                  SizedBox(height: Dimensions.height20),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: 'Sunt qui ea minim aute labore magna fugiat aliquip. Irure ipsum Lorem aliqua excepteur laborum occaecat enim id dolor adipisicing nostrud adipisicing fugiat. Magna sunt non ullamco quis deserunt ea id adipisicing consectetur eiusmod. Ut tempor ullamco dolore non. Et eiusmod sint duis minim excepteur consequat fugiat laboris irure excepteur reprehenderit sunt labore.'
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        // height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30, 
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2), 
                  const Icon(Icons.add, color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
              child: BigText(text: "\$15.000 | Agregar", color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}