import 'package:flutter/material.dart';
import '../presentationLayer/screens/main_screen.dart';
import '../presentationLayer/screens/splash_screen.dart';
import 'app_constant.dart';
class GeneratedRoute{
  static Route<dynamic> onGeneratedRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case AppConstant.splashRoute:
      // var arguments=routeSettings.arguments as Map;
        return _materialRoute(const SplashScreen());

      case AppConstant.mainRoute:
      // routeSettings.arguments as Map;
        return _materialRoute(MainScreen());

      default:
        return _materialRoute(const Scaffold(body: Center(child: Text('No Page found')),));
    }
  }
  static Route _materialRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_)=>view,

    );
  }
}