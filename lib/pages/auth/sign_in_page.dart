import 'package:delivery_ecommerce/base/custom_loader.dart';
import 'package:delivery_ecommerce/base/show_custom_snack_bar.dart';
import 'package:delivery_ecommerce/controllers/auth_controller.dart';
import 'package:delivery_ecommerce/pages/auth/sign_up_page.dart';
import 'package:delivery_ecommerce/routes/route_helper.dart';
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
    
    // SignIn: Login with email and password
    // ignore: no_leading_underscores_for_local_identifiers
    void _login(AuthController authController) {

      // Inputs data
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Inputs Validation // ? Can I make a refactor and optimize?
      if (email.isEmpty) {
        showCustomSnackBar(
          'Ingrese su correo electrónico',
          title: 'Correo electrónico'
        );
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar(
          'Por favor ingrese un correo válido',
          title: 'Correo electrónico inválido'
        );
      } else if (password.isEmpty) {
        showCustomSnackBar(
          'Ingrese su contraseña', 
          title: 'Contraseña'
        );
      } else if (password.length < 8) {
        showCustomSnackBar(
          'La contraseña no puede ser menor a 8 dígitos',
          title: 'Contraseña'
        );
      } else {
        // showCustomSnackBar('Datos ingresados correctamente', title: 'Felicitaciones');
        // Si todos los datos fueron ingresados entonces:

        // Send data to API
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            // print("Success login");
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){ 
        return !authController.isLoading ? SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  icon: Icons.password_sharp,
                  isObscure: true),
              SizedBox(height: Dimensions.height20),
              // Sign Up Button
              GestureDetector(
                onTap: () {
                  _login(authController);
                },
                child: Container(
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
        ):
        const CustomLoader();
      })
    );
  }
}
