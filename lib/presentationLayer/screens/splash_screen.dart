import 'package:flutter/material.dart';

import '../../Utils/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    _gotoNextPages(context);
    return Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: const Color(0xffF3F8F5),
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '',
                style: TextStyle(
                  color: Color(0xff107144),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.6,
                // width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset('assets/images/logo.png')),
              //   SizedBox(height: 50,),
              //  Obx(()=>Text(controller.splashScreenName.value, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22, color: AppConstant.myMainColor() ),)),
            ],
          ),
        ));
  }


  void _gotoNextPages(context) async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(context, AppConstant.signInRoute, (route) => false);

  }
}

