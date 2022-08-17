import 'dart:async';

import 'package:get/get.dart';
import 'package:sustomer_task/export.dart';

class DetailsController extends GetxController with StateMixin<DetailsPage> {
  int selectedAnswer = 0;
  RxInt timeValue = 10.obs;

  @override
  void onInit() {
    selectedAnswer = Get.arguments;
    change(null, status: RxStatus.success());
    super.onInit();
    initTimer();
  }

  onBack() {
    Get.back();
  }

  void initTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (timeValue.value <= 0) {
        timer.cancel();
        openNextPage();
      } else {
        timeValue.value = timeValue.value - 1;
        print(timeValue.value);
      }
    });
  }

  void openNextPage() {
    AppRoutes.appRoutes(
      RouteNames.homeScreen,
    );
  }
}
