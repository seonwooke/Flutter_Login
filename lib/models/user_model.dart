import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import '../constants/constants.dart';

class UserModel {
  LoginType loginType;
  String uid;
  String displayName;
  String email;
  String photoUrl;

  UserModel({
    required this.loginType,
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginType': loginType.name,
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      loginType: LoginType.values.byName(map['loginType'] as String),
      uid: map['uid'] as String,
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  factory UserModel.empty() {
    return UserModel(
      loginType: LoginType.email,
      uid: '',
      displayName: '',
      email: '',
      photoUrl: '',
    );
  }

  factory UserModel.signUp(LoginType loginType, User user, String displayName) {
    return UserModel(
      loginType: loginType,
      uid: user.uid,
      email: user.email!,
      displayName: displayName,
      photoUrl: '',
    );
  }

  factory UserModel.kSignUp(LoginType loginType, kakao.User user) {
    return UserModel(
      loginType: loginType,
      uid: user.id.toString(),
      email: user.kakaoAccount!.email!,
      displayName: user.kakaoAccount!.profile!.nickname!,
      photoUrl: '',
    );
  }

  factory UserModel.emailSignUp(User user, String displayName) {
    return UserModel.signUp(LoginType.email, user, displayName);
  }

  factory UserModel.socialSignUp(LoginType loginType, User user) {
    return UserModel.signUp(
      loginType,
      user,
      DataUtils.instance.randomNicknameGenerator(),
    );
  }

  factory UserModel.kakaoSignUp(LoginType loginType, kakao.User user) {
    return UserModel.kSignUp(
      loginType,
      user,
    );
  }
}
