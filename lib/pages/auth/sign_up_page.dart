import 'package:delivery_ecommerce/base/custom_loader.dart';
import 'package:delivery_ecommerce/base/show_custom_snack_bar.dart';
import 'package:delivery_ecommerce/controllers/auth_controller.dart';
import 'package:delivery_ecommerce/models/sign_up_body_model.dart';
import 'package:delivery_ecommerce/utils/colors.dart';
import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:delivery_ecommerce/widgets/app_text_field.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Input controllers
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    // Social Media Images
    var signUpImages = [
      "gmail.png",
      "facebook.png",
      "twitter.png",
    ];

    // SignUp: Create a new account
    // ignore: no_leading_underscores_for_local_identifiers
    void _registration(AuthController authController) {

      // Inputs data
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Inputs Validation // ? Can I make a refactor and optimize?
      if (name.isEmpty) {
        showCustomSnackBar('Ingrese su nombre', title: 'Nombre');
      } else if (phone.isEmpty) {
        showCustomSnackBar('Ingrese su número de celular',
            title: 'Número de celular');
      } else if (email.isEmpty) {
        showCustomSnackBar('Ingrese su correo electrónico',
            title: 'Correo electrónico');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Por favor ingrese un correo válido',
            title: 'Correo electrónico inválido');
      } else if (password.isEmpty) {
        showCustomSnackBar('Ingrese su contraseña', title: 'Contraseña');
      } else if (password.length < 8) {
        showCustomSnackBar('La contraseña no puede ser menor a 8 dígitos',
            title: 'Contraseña');
      } else {
        // showCustomSnackBar('Datos ingresados correctamente', title: 'Felicitaciones');
        // Si todos los datos fueron ingresados entonces:

        //  Create create a new user
        SignUpBody signUpBody = SignUpBody(
          name: name, 
          phone: phone, 
          email: email, 
          password: password
        );

        // Send data to API
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // ignore: no_leading_underscores_for_local_identifiers
      body: GetBuilder<AuthController>(builder: (_authController) { // Consultar
        return !_authController.isLoading ? SingleChildScrollView(
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
              // Name
              AppTextField(
                  textController: nameController,
                  hintText: 'Nombre',
                  icon: Icons.person),
              SizedBox(height: Dimensions.height20),
              // Phone Number
              AppTextField(
                  textController: phoneController,
                  hintText: 'Número de celular',
                  icon: Icons.phone),
              SizedBox(height: Dimensions.height20),
              // Sign Up Button
              GestureDetector(
                onTap: () {
                  _registration(_authController);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor),
                  child: Center(
                    child: BigText(
                        text: "Registrarse",
                        size: Dimensions.font20 + Dimensions.font20 / 5,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10),
              // Have an account already?
              RichText(
                // WHATS
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Ya tengo una cuenta",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font20)),
              ),
              SizedBox(height: Dimensions.screenHeight * 0.05),
              // Sign Up options
              RichText(
                // WHATS
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Registrarse usando uno de los siguientes métodos",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font16)),
              ),
              Wrap(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: Dimensions.radius30,
                            backgroundImage: AssetImage(
                                'assets/images/${signUpImages[index]}'),
                            backgroundColor: Colors.white,
                          ),
                        )),
              )
            ],
          ),
        ):
        const CustomLoader();
      }),
    );
  }
}
