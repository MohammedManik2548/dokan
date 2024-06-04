import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';

import '../dataLayer/models/Images.dart';
import '../dataLayer/models/ProductModel.dart';

class SearchScreenController extends GetxController {

  var productList = <ProductModel>[].obs;
  var imageList = <Images>[].obs;


  @override
  void onInit() {
    super.onInit();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await readJsonData();
    // });
    // readJsonData();
    print('call_json');
  }

  Future<void> readJsonData()async{

    try{
      productList.clear();
      var jsonData = await rootBundle.rootBundle.loadString('jsonFile/response.json');
      var list = json.decode(jsonData) as List;

      var tempList = list.map((e) => ProductModel.fromJson(e)).toList();
      productList.value.addAll(tempList);
    }catch(e, l){
      print(e);
      print(l);
    }

  }

}