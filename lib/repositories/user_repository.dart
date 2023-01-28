import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/constants.dart';
import '../models/models.dart';

class UserRepository {
  /// 싱글톤(Singleton) 패턴 : 객체의 인스턴스가 오직 하나만 생성되는 것
  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  final _userCollection = FirebaseFirestore.instance.collection("user");

  Future<void> addUserToFirebase(UserModel userModel) async {
    try {
      if (kDebugMode) {
        print(userModel);
      }
      await _userCollection.doc(userModel.uid).set(userModel.toMap());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateLoginType(LoginType type, String uid) async {
    _userCollection.doc(uid).update({'loginType': type.name});
  }
}
