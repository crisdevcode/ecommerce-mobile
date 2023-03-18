import 'package:delivery_ecommerce/controllers/auth_controller.dart';
import 'package:delivery_ecommerce/controllers/cart_controller.dart';
import 'package:delivery_ecommerce/routes/route_helper.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:delivery_ecommerce/widgets/account_widget.dart';
import 'package:delivery_ecommerce/widgets/app_icon.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Center(
            child: BigText(text: 'Mi Perfil', size: 24, color: Colors.white),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height20),
          child: Column(
            children: [
              // Profile icon
              AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height45 + Dimensions.height30,
                size: Dimensions.height15 * 10,
              ),
              SizedBox(height: Dimensions.height30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Name
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Cristian"),
                      ),
                      SizedBox(height: Dimensions.height20),
                      // Phone
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "3183482085"),
                      ),
                      SizedBox(height: Dimensions.height20),
                      // Email
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "usertest@gmail.com"),
                      ),
                      SizedBox(height: Dimensions.height20),
                      // Address
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Completa tu dirección"),
                      ),
                      SizedBox(height: Dimensions.height20),
                      // Message
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.red,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Mensajes"),
                      ),
                      SizedBox(height: Dimensions.height20),
                      GestureDetector(
                        onTap: () {
                          if (Get.find<AuthController>().userLoggedIn()) {
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clear();
                            Get.find<CartController>().clearCartHistory();
                            Get.offNamed(RouteHelper.getSignInPage());
                          } else {
                            print('estás desconectado');
                          }
                        },
                        child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout,
                            backgroundColor: Colors.red,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(text: "Cerrar sesión"),
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
