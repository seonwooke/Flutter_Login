import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../services/auth/auth.dart';

class UserController extends GetxController {
  /// AuthController.instance.something과 같이 사용 가능
  static UserController get instance => Get.find();

  final currentUserModel = UserModel.empty().obs;
  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> init() async {
    UserModel userModel = await UserRepository.instance.getUser(currentUserUid);
    if (userModel.uid.isEmpty) {
      await Authentication.instance.signOut();
    } else {
      currentUserModel.value = userModel;
    }
  }

  @override
  Future<void> onInit() async {
    await init();
    super.onInit();
  }
/*
  // /// User의 정보가 들어가는 변수
  // late Rx<User?> user;

  // /// FirebaseAuthentication 모듈을 위한 변수
  // FirebaseAuth authentication = FirebaseAuth.instance;

  // /// Controller가 Init된 후, 네트워크에서 전달되는 정보를 통한 기능을 초기화 하기 위함
  // @override
  // void onReady() {
  //   super.onReady();

  //   /// User 정보 받아와서 변수에 담기
  //   user = Rx<User?>(authentication.currentUser);

  //   /// User의 상태 변화 추적
  //   user.bindStream(authentication.userChanges());

  //   /// Firebase에서 사용자의 변화를 앱에 적용시켜주는 것
  //   ever(user, moveToPage);
  // }

  // /// User의 상태에 따른 페이지 이동
  // moveToPage(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => SignInPage());
  //   } else {
  //     Get.offAll(() => HomePage());
  //   }
  // }

  // void addAuthToFirebase(String email, String password) async {
  //   try {
  //     await authentication.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'ERROR MESSAGE',
  //       'User Message',
  //       titleText: const Text('등록 실패'),
  //       messageText: Text(e.toString()),
  //     );
  //   }
  // }

  // void signInAuth(String email, String password) async {
  //   try {
  //     await UserController.instance.authentication.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'ERROR MESSAGE',
  //       'User Message',
  //       titleText: const Text('로그인 실패'),
  //       messageText: Text(e.toString()),
  //     );
  //   }
  // }
*/
}
