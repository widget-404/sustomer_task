import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustomer_task/export.dart';

class HomeController extends GetxController with StateMixin<HomePage> {
  final HomeUseCase useCase;
  final SharedPreferences preferences;

  HomeController(this.useCase, this.preferences);

  int selectedQuestion = 0;
  RxInt selectedValue = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedValue.value = -1;
    selectedQuestion = preferences.getInt('selectedQuestion') ?? 0;
    change(null, status: RxStatus.loading());
    await useCase.getData();
    if (useCase.surveyData.data.isNotEmpty) {
      change(null, status: RxStatus.success());
    } else {
      change(
        null,
        status: RxStatus.empty(),
      );
    }
  }

  SurveyModel get surveyData => useCase.surveyData.data[selectedQuestion];

  openDetailsPage() async {
    if (selectedQuestion < useCase.surveyData.data.length - 1) {
      selectedQuestion++;
      preferences.setInt('selectedQuestion', selectedQuestion);
    }
    await Future.delayed(const Duration(
      milliseconds: 500,
    ));
    AppRoutes.appRoutes(RouteNames.detailsScreen, arg: selectedValue.value);
  }
}
