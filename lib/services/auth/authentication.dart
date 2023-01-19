import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/routes/routes.dart';

class Authentication {
  /// 싱글톤(Singleton) 패턴 : 객체의 인스턴스가 오직 하나만 생성되는 것
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();

  static Authentication get instance => _instance;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Get.offAllNamed(AppRoutes.instance.SIGNIN));
  }
}