import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentationLayer/screens/dashboard_screen.dart';
import '../presentationLayer/screens/home_screen.dart';
import '../presentationLayer/screens/profile_screen.dart';
import '../presentationLayer/screens/shopping_screen.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DashboardScreen(),
    ShoppingScreen(),
    ProfileScreen(),
  ];

  Widget get currentScreen => _screens[selectedIndex];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}