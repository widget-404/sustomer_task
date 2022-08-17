import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sustomer_task/export.dart';

class SplashController extends GetxController with StateMixin<Splash> {
  bool isInitialized = false;

  void initialize({required BuildContext context}) async {
    if (!isInitialized) {
      final di = GetInstance();
      initAppResources(context);
      Future.delayed(const Duration(seconds: 3), () => navigateToHome());
    }
  }

  void initAppResources(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      initializeAppResources(context: context);
    }
  }

  void navigateToHome() {
    AppRoutes.appRoutes(RouteNames.homeScreen);
  }
}
