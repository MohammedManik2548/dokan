import 'package:dokan/presentationLayer/widgets/custom_button.dart';
import 'package:dokan/presentationLayer/widgets/small_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/app_constant.dart';
import '../../businessLogicLayer/signIn_controller.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = SignInController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(33.0, 100.0, 33.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 156,
              height: 50,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 80),
            Text(
              'Sign In',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              image: 'assets/images/email.png',
              hint: 'Email',
              controller: controller.emailController, obscureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Obx(() => CustomTextField(
              image: 'assets/images/lock.png',
              hint: 'Password',
              icon: IconButton(
                icon: Icon(
                  !controller.isPasswordShow.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  controller.isPasswordShow.value = !controller.isPasswordShow.value;
                },
              ),
              controller: controller.passwordController, obscureText: !controller.isPasswordShow.value,
            ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            CustomButton(
              text: 'Login',
              containerColor: const Color(0xFFF75F55),
              onTap: () {
                controller.signIn();
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  image: 'assets/images/fb.png',
                  containerColor: const Color(0xFFFFFFFF),
                  onTap: () {},
                ),
                SizedBox(width: 14),
                SmallButton(
                  image: 'assets/images/google.png',
                  containerColor: const Color(0xFFFFFFFF),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 52.0),
            InkWell(
              onTap: () => Get.toNamed(AppConstant.signUpRoute),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create New Account',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                      color: Color(0xFF383C40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
