import 'package:flutter_login/constants/enums/enums.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/routes/routes.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

class Authentication {
  /// 싱글톤(Singleton) 패턴 : 객체의 인스턴스가 오직 하나만 생성되는 것
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();

  static Authentication get instance => _instance;

  /// 이메일 회원가입
  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      if (user != null) {
        await UserRepository.instance.addUserToFirebase(
          UserModel.emailSignUp(
            user,
            displayName,
          ),
        );
        Get.offNamed(AppRoutes.instance.HOME);

        return user;
      }

      return user;
    } on FirebaseAuthException catch (e) {
      errorSnackBar(e);
    } catch (e) {
      if (kDebugMode) {
        print('sign up failed');
        print(e.toString());
      }

      return null;
    }

    return null;
  }

  /// 이메일 로그인
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = result.user;

      if (user != null) {
        Get.offNamed(AppRoutes.instance.HOME);
      } else {
        await signOut();
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } on FirebaseAuthException catch (e) {
      errorSnackBar(e);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// 이메일 로그아웃
  Future<void> signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAllNamed(AppRoutes.instance.SIGNIN));
  }

  /// 구글 로그인
  Future<User?> signInWithGoogle() async {
    User? user;

    if (kIsWeb) {
      /// 웹인지 확인
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithPopup(authProvider);

        user = userCredential.user;

        if (user != null && userCredential.additionalUserInfo!.isNewUser) {
          await UserRepository.instance.addUserToFirebase(
            UserModel.socialSignUp(
              LoginType.google,
              user,
            ),
          );
        } else if (user != null) {
          await UserRepository.instance.updateLoginType(
            LoginType.google,
            user.uid,
          );
        }
      } catch (e) {
        if (kDebugMode) {
          /// 디버그 모드인지 확인
          print(e);
        }
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      try {
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          try {
            final UserCredential userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            user = userCredential.user;

            if (user != null && userCredential.additionalUserInfo!.isNewUser) {
              await UserRepository.instance.addUserToFirebase(
                UserModel.socialSignUp(
                  LoginType.google,
                  user,
                ),
              );
            } else if (user != null) {
              await UserRepository.instance
                  .updateLoginType(LoginType.google, user.uid);
            }
          } on FirebaseAuthException catch (e) {
            if (kDebugMode) {
              print(e.code);
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
        return user;
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print(e);
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return null;
  }

  /// 구글 로그아웃
  Future<void> signOutWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void errorSnackBar(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        Get.snackbar(
          '유효하지 않는 이메일',
          '유효하지 않는 이메일 형식입니다.🙁',
        );
        break;
      case 'user-not-found':
        Get.snackbar(
          '존재하지 않는 이메일 입니다.',
          '회원가입을 먼저 해주세요.🙁',
        );
        break;
      case 'wrong-password':
        Get.snackbar(
          '패스워드가 틀렸습니다.',
          '패스워드를 확인 해주세요.🙁\n구글 혹은 애플 계정으로 로그인한 경우일 수 있습니다.',
        );
        break;
      case 'network-request-failed':
        Get.snackbar(
          '네트워크 오류',
          '모바일 네트워크 혹은 와이파이를 확인해 주세요.🙁',
        );
        break;
      case 'email-already-in-use':
        Get.snackbar(
          '이메일 중복',
          '해당 이메일은 이미 존재합니다.🙁',
        );
        break;
      case 'weak-password':
        Get.snackbar(
          '너무 쉬운 비밀번호',
          '비밀번호를 6자 이상으로 입력해주세요.🙁',
        );
        break;
      case 'operation-not-allowed':
        Get.snackbar(
          '허용되지 않는 방법',
          '허용되지 않은 로그인 방법입니다.🙁',
        );
        break;
      default:
        Get.snackbar(
          e.code,
          '${e.message}',
          duration: const Duration(seconds: 5),
        );
    }
  }
}
