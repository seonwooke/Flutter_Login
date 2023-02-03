import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/test/test.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import '../controllers/controllers.dart';

class KakaoLogin implements SocialLogin {
  final signController = Get.put(SignController());
  final _firebaseAuthRemoteDataSource = FirebaseAuthRemoteDataSource();

  @override
  Future<void> login() async {
    bool isInstalled = await kakao.isKakaoTalkInstalled();
    if (isInstalled) {
      await kakao.UserApi.instance.loginWithKakaoTalk();
    } else {
      await kakao.UserApi.instance.loginWithKakaoAccount();
    }

    kakao.User? user = await kakao.UserApi.instance.me();
    if (!user.id.isNaN) {
      final token = await _firebaseAuthRemoteDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
        'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,
      });

      await FirebaseAuth.instance.signInWithCustomToken(token);

      SignController.instance.done();
      print(user.kakaoAccount!.email);
    } else {
      SignController.instance.done();
      await logout();
    }
  }

  @override
  Future<void> logout() async {
    await kakao.UserApi.instance.unlink();
    await FirebaseAuth.instance.signOut();
  }
}
