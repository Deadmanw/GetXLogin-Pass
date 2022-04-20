import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_/repository/routes/routes.dart';

import 'controller/auth_controller.dart';

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: authController,
      builder: (_) {
        return const GetMaterialApp(
          title: 'Authentication Flow',
          onGenerateRoute: Routes.routes,
        );
      },
    );
  }
}
