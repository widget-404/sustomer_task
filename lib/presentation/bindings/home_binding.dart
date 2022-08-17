import 'package:get/get.dart';
import 'package:sustomer_task/export.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<HomeUseCase>(), Get.find()));
    // Get.put<Service>(()=> Api());
  }
}
