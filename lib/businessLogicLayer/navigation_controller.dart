import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentationLayer/screens/dashboard_screen.dart';
import '../presentationLayer/screens/home_screen.dart';
import '../presentationLayer/screens/profile_screen.dart';
import '../presentationLayer/screens/search_Screen.dart';
import '../presentationLayer/screens/shopping_screen.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> _screens = [
    SearchScreen(),
    HomeScreen(),
    DashboardScreen(),
    ShoppingScreen(),
    ProfileScreen(),
  ];

  Widget get currentScreen => _screens[selectedIndex.value];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }
}