
import 'package:dokan/presentationLayer/widgets/custom_button.dart';
import 'package:dokan/presentationLayer/widgets/small_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/app_constant.dart';
import '../../businessLogicLayer/signUp_controller.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = SignUpController();
   SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(33.0, 100.0, 33.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Stack(
              children: [
                Container(
                  width: 122,
                  height: 122,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(180)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0,3),
                          color: Colors.grey.withOpacity(0.3)
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://maxipower.com.cn/public/images/images-empty.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF9472),
                          Color(0xFFF2709C),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(180)),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 52.0,
            ),
            CustomTextField(image: 'assets/images/personIcon.png',hint: 'Name',controller: controller.nameController, obscureText: false,),
            const SizedBox(height: 20.0),
            CustomTextField(image: 'assets/images/email.png',hint: 'Email',controller: controller.emailController, obscureText: false,),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              image: 'assets/images/lock.png',
              hint: 'Password',
              controller: controller.passwordController, obscureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              image: 'assets/images/lock.png',
              hint: 'Confirm Password',
              controller: controller.confPasswordController, obscureText: false,
            ),
            const SizedBox(
              height: 78.0,
            ),
            CustomButton(
              text: 'Sign Up',
              containerColor: Color(0xFFF75F55),
              onTap: (){},
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(image: 'assets/images/fb.png', containerColor: const Color(0xFFFFFFFF),onTap: (){},),
                SizedBox(width: 14),
                SmallButton(image: 'assets/images/google.png', containerColor: const Color(0xFFFFFFFF),onTap: (){},),
              ],
            ),
            SizedBox(
              height: 52.0,
            ),
            SizedBox(
              width: 252,
              height: 21,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: -0.3,
                    child: SizedBox(
                      height: 21,
                      child: Text(
                        'Already have an account?',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w300,
                          fontSize: 17.4,
                          letterSpacing: 0.2,
                          color: Color(0xFF383C40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.1,
                    bottom: -0.3,
                    child: InkWell(
                      onTap: ()=> Get.toNamed(AppConstant.signInRoute),
                      child: SizedBox(
                        height: 21,
                        child: Text(
                          'Login',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 17.4,
                            letterSpacing: 0.2,
                            color: Color(0xFF2893E3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 54.0,
            ),
          ],
        ),
      ),
    );
  }
}
