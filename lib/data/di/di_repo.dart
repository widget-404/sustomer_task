import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustomer_task/export.dart';

class RepoDependencies {
  late NetworkHelper _networkHelper;
  late EndPoints _endPoints;
  late FirebaseFirestore _fireStore;
  late SharedPreferences _sharedPreferences;

  Future init() async {
    _endPoints = EndPoints();
    _networkHelper = NetworkHelperImpl();
    _fireStore = FirebaseFirestore.instance;
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  initializeRepoDependencies() {
    Get.lazyPut<SharedPreferences>(
      () => _sharedPreferences,
      fenix: true,
    );
    Get.lazyPut<HomeRepo>(
      () => HomeRepoImpl(_networkHelper, _endPoints, _fireStore),
      fenix: true,
    );
  }
}
