import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'export.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeUseCasesDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Absolute Solution',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(60, 53, 255, 1)),
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splashScreen,
      getPages: AppRoutes.getPage,
      smartManagement: SmartManagement.keepFactory,
      showPerformanceOverlay: false,
    );
  }
}
