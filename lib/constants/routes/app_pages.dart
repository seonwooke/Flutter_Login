import 'package:get/route_manager.dart';


import '../../pages/pages.dart';
import 'routes.dart';

class AppPages {
  /// 싱글톤(Singleton) 패턴 : 객체의 인스턴스가 오직 하나만 생성되는 것
  AppPages._privateConstructor();
  static final AppPages _instance = AppPages._privateConstructor();

  static AppPages get instance => _instance;

  var pages = [
    GetPage(name: AppRoutes.instance.START, page: () => StartPage()),
    GetPage(name: AppRoutes.instance.SIGNIN, page: () => SignInPage()),
    GetPage(name: AppRoutes.instance.SIGNUP, page: () => SignUpPage()),
    GetPage(name: AppRoutes.instance.HOME, page: () => const HomePage()),
  ];
}
