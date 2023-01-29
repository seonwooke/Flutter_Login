import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import 'auth.dart';

class KakaoLogin implements Login {
  @override
  Future<void> signIn() async {
    kakao.User? user = await Authentication.instance.signInWithKakao();
    if (user != null) {
      Get.offNamed(AppRoutes.instance.HOME);
    } else {
      SignController.instance.done();
      await signOut();
    }
  }

  @override
  Future<void> signOut() async {
    await Authentication.instance.signOutWithKakao();
  }
}
