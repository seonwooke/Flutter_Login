import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/firebase_options.dart';
import 'package:get/get.dart';

import 'bindings/binding.dart';
import 'constants/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.routes,
      defaultTransition: Transition.native,
    );
  }
}
