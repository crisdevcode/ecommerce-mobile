import 'package:delivery_ecommerce/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:delivery_ecommerce/widgets/app_text_field.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Input controllers
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05),
            // App Logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            // Welcome Text
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hola",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Ingresar con tu cuenta",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500] 
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // Email
            AppTextField(
                textController: emailController,
                hintText: 'Correo electrónico',
                icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            // Password
            AppTextField(
                textController: passwordController,
                hintText: 'Contraseña',
                icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20),
            // Sign Up Button
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                    text: "Iniciar sesión",
                    size: Dimensions.font20 + Dimensions.font20 / 5,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // Have an account already?
            Row(
              children: [
                Expanded(
                  child: Container(), // WHATS
                ),
                // WHATS
                RichText(
                  text: TextSpan(
                      text: "Ingresar con tu cuenta",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20)),
                ),
                SizedBox(width: Dimensions.width20)
              ],
            ),
            SizedBox(height: Dimensions.screenHeight * 0.05),
            // Sign Up options
            RichText(
              // WHATS
              text: TextSpan(
                text: "¿No tienes una cuenta?",
                style: TextStyle(
                  color: Colors.grey[500], 
                  fontSize: Dimensions.font16
                ), 
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => const SignUpPage(), transition: Transition.fade),
                    text: ' Registrarse',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor,
                      fontSize: Dimensions.font20
                    ),
                  )
                ]
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
