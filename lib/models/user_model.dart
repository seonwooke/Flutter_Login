import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../constants/enums/enums.dart';

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

  factory UserModel.emailSignUp(User user, String displayName) {
    return UserModel.signUp(LoginType.email, user, displayName);
  }
}
