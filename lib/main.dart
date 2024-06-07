import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Utils/app_constant.dart';
import 'Utils/generated_route.dart';
import 'Utils/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dokan',
      theme: light,
      // navigatorKey: navigatorKey,
      onGenerateRoute: GeneratedRoute.onGeneratedRoute,
      initialRoute: AppConstant.splashRoute,
      smartManagement: SmartManagement.full,
      builder: EasyLoading.init(),
    );
  }
}
