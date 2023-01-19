import 'package:get/route_manager.dart';


import '../../pages/pages.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.LOGIN, page: () => SignInPage()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignUpPage()),
    GetPage(name: AppRoutes.HOME, page: () => const HomePage()),
  ];
}
