import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';

import '../dataLayer/models/Images.dart';
import '../dataLayer/models/ProductModel.dart';

class SearchScreenController extends GetxController {


  var newestCheckBox = false.obs;
  var oldestCheckBox = false.obs;
  var priceLowCheckBox = false.obs;
  var priceHighCheckBox = false.obs;
  var bestSellCheckBox = false.obs;
  var filterList = <ProductModel>[].obs;
  var productList = <ProductModel>[].obs;
  var temp =<ProductModel>[].obs;
  var lowPriceProductName = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> readJsonData() async {
    try {
      productList.clear();
      final jsonData = await rootBundle.loadString('jsonFile/product.json');
      final decodedData = json.decode(jsonData) as List<dynamic>;
      print('hhfhhhh: $decodedData');
      filterList.addAll(decodedData.map((e) => ProductModel.fromJson(e)).toList());
      print('filete_list_length: ${filterList.length}');
      productList.addAll(decodedData.map((e) => ProductModel.fromJson(e)).toList());
    } catch (e, l) {
      print('Error decoding JSON: $e');
      print('Error decoding JSON: $l');
      rethrow; // Rethrow the error for further handling
    }
  }


  void sortByPriceAscending() async{
    /// Sort the list by price in ascending order (low to high)
    print('onTap');
    EasyLoading.show();
    Get.back();
    await Future.delayed(Duration(seconds: 3));
    productList.value.sort((a, b)=> a.price!.compareTo(b.price.toString()));
    EasyLoading.dismiss();
  }
  void sortByPriceDescending()async {
    /// Sort the list by price in ascending order (low to high)
    print('onTap');
    EasyLoading.show();
    Get.back();
    await Future.delayed(Duration(seconds: 3));
    productList.value.sort((a, b)=> b.price!.compareTo(a.price.toString()));
    EasyLoading.dismiss();
  }

  clearBox(){
    newestCheckBox.value = false;
    oldestCheckBox.value = false;
    priceLowCheckBox.value = false;
    priceHighCheckBox.value = false;
    bestSellCheckBox.value = false;
  }
}