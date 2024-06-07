import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dokan/Utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Utils/utils.dart';


class SignUpController extends GetxController {


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();


  Future<void> signUp()async{
    print('call_sinIn_method: ${emailController.text}');
    print('call_sinIn_method: ${passwordController.text}');
    try{
      EasyLoading.show(status: 'Loading...');
      final dio = Dio();
      var map ={
        "username":nameController.text.toString(),
        "email":emailController.text.toString(),
        "password":passwordController.text.toString(),
      };
      print('call_sinIn_method: $map');

      var response = await dio.post(
          'https://apptest.dokandemo.com/wp-json/wp/v2/users/register',
          data: map);

      if(response.statusCode == 200){
        EasyLoading.dismiss();
        Get.toNamed(AppConstant.signInRoute);
        _clear();
      }

    }catch(e, l){
      print('check_error: $e');
      print('check_error_line: $l');
    }

  }
  _clear(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }

}