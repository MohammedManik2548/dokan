import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../Utils/app_constant.dart';
import '../../businessLogicLayer/navigation_controller.dart';
import '../widgets/custom_floatingButton.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


class MainScreen extends StatelessWidget {
  final NavigationController controller = NavigationController();
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) => controller.currentScreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GradientFloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, AppConstant.mainRoute, (route) => false);
        },
        icon: Icons.search,
        gradient: const LinearGradient(
          colors: [Color(0xffFF679B), Color(0xffFF7B51)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      bottomNavigationBar: GetX<NavigationController>(
        builder: (controller){
          return AnimatedBottomNavigationBar(
            backgroundColor: Colors.white,
              icons: controller.iconList,
              activeIndex: controller.selectedIndex.value,
              activeColor: const Color(0xFFF75F55),
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.defaultEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              height: 80,
              onTap: (index){
                controller.onItemTapped(index);
              }
          );
        },
      ),
    );
  }
}
