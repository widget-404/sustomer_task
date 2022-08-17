class SurveyList {
  final List<SurveyModel> data;

  SurveyList({required this.data});

  factory SurveyList.fromJson(dynamic json) {
    List<SurveyModel> surveyList = [];
    if (json != null) {
      for (int i = 0; i < json.length; i++) {
        surveyList.add(
          SurveyModel.fromJson(json[i.toString()]),
        );
      }
    }
    return SurveyList(data: surveyList);
  }
}

class SurveyModel {
  final String question;
  final List<String> options;

  SurveyModel({required this.question, required this.options});

  factory SurveyModel.fromJson(dynamic json) {
    List<String> options = [];
    if (json['options'] != null) {
      json['options'].forEach((v) {
        options.add(v);
      });
    }
    return SurveyModel(
      question: json['question'],
      options: options,
    );
  }
}
