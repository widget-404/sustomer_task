import 'package:get/get.dart';
import 'package:sustomer_task/export.dart';

Future<void> initializeUseCasesDependencies() async {
  final RepoDependencies repoDependencies = RepoDependencies();
  await repoDependencies.init();
  await repoDependencies.initializeRepoDependencies();

  Get.lazyPut<HomeUseCase>(
    () => HomeUseCase(
      Get.find<HomeRepo>(),
    ),
    fenix: true,
  );
}
