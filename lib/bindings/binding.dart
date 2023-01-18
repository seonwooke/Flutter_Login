import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
