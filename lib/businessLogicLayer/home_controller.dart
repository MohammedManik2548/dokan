

import 'package:get/get.dart';

import '../presentationLayer/screens/dashboard_screen.dart';
import '../presentationLayer/screens/home_screen.dart';
import '../presentationLayer/screens/main_screen.dart';
import '../presentationLayer/screens/profile_screen.dart';
import '../presentationLayer/screens/shopping_screen.dart';

class HomeController extends GetxController{
  var selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    DashboardScreen(),
    ShoppingScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
  }
  void onItemTapped(var index) {
      selectedIndex.value = index;
  }
}