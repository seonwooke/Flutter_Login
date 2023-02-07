import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'bindings/binding.dart';
import 'constants/constants.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: 'e41b26ff080aa9989d44df90cd7255b1');
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
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: ((context, child) => GetMaterialApp(
            initialBinding: InitBinding(),
            initialRoute: AppRoutes.instance.START,
            getPages: AppPages.instance.pages,
            defaultTransition: Transition.native,
          )),
    );
  }
}
//