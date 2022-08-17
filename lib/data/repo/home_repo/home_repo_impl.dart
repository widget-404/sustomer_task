import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sustomer_task/export.dart';

class HomeRepoImpl implements HomeRepo {
  final NetworkHelper _networkHelper;
  final EndPoints _endPoints;
  final FirebaseFirestore fireStore;

  HomeRepoImpl(this._networkHelper, this._endPoints, this.fireStore);

  @override
  Future<Either<AppError, SurveyModel>> getHomeData() async {
    try {
      final response = await _networkHelper.get(
        _endPoints.getCoronaSummary(),
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        return Right(SurveyModel.fromJson(data));
      }
      return Left(
        AppError(),
      );
    } catch (e) {
      return Left(
        AppError(title: e.toString()),
      );
    }
  }

  @override
  Future<SurveyList> getData() async {
    // Get docs from collection reference
    CollectionReference querySnapshot = fireStore.collection('mcqs');

    QuerySnapshot doc = await querySnapshot.get();

    // Get data from docs and convert map to List
    final allData = doc.docs.map((doc) => doc.data()).toList();

    print(allData);
    SurveyList data = SurveyList.fromJson(allData[0]);
    return data;
  }
}
