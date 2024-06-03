import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../Utils/app_constant.dart';
import '../../businessLogicLayer/navigation_controller.dart';
import '../widgets/custom_floatingButton.dart';

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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          height: 70,
          notchMargin: 10.0,
          elevation: 50,
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          child: GetBuilder<NavigationController>(
            builder: (controller){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      onPressed: ()=> controller.onItemTapped(1),
                      icon: const Icon(Icons.home_outlined,
                        color: Color(0xff6E7FAA),),
                    ),
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
                      child: IconButton(
                        onPressed: ()=> controller.onItemTapped(2),
                        icon: const Icon(
                          Icons.dashboard_outlined,
                          color: Color(0xff6E7FAA),
                        ),
                      )
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                      child: IconButton(
                        onPressed: ()=> controller.onItemTapped(3),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Color(0xff6E7FAA),
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        onPressed: ()=> controller.onItemTapped(4),
                        icon: const Icon(
                          Icons.person_outline,
                          color: Color(0xff6E7FAA),
                        ),
                      )
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
