import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../Utils/app_constant.dart';
import '../Utils/utils.dart';

class SignInController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  var isPasswordShow = false.obs;

  Future<void> signIn()async{
    print('call_sinIn_method: ${emailController.text}');
    print('call_sinIn_method: ${passwordController.text}');
    try{
      EasyLoading.show(status: 'Loading...');
      final dio = Dio();
      var map ={
        "username":emailController.text.toString(),
        "password":passwordController.text.toString(),
      };
      print('call_sinIn_method: $map');
       // var send = jsonDecode(map);
      var response = await dio.post(
        'https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token',
        queryParameters: map);

      if(response.statusCode == 200){
        EasyLoading.dismiss();
        Get.toNamed(AppConstant.mainRoute);
        emailController.clear();
        passwordController.clear();
      }

    }catch(e, l){
      print('check_error: $e');
      print('check_error_line: $l');
    }finally{
      EasyLoading.dismiss();
    }


  }


}