import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
