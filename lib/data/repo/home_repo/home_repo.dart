import 'package:sustomer_task/export.dart';

mixin HomeRepo {
  // Future<Either<AppError, HomeModel>> getData();
  Future<SurveyList> getData();
}
