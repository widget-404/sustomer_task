import 'package:sustomer_task/export.dart';

class HomeUseCase {
  final HomeRepo repo;

  HomeUseCase(this.repo);

  late SurveyList surveyData;

  Future<void> getData() async {
    try {
      final data = await repo.getData();
      populateSurveyData(data);
      print(data);
    } catch (error) {
      // return Left(AppError(title: error.toString()));
    }
  }

  void populateSurveyData(SurveyList surveyList) {
    surveyData = surveyList;
  }
}
