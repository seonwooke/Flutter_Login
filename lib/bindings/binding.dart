import 'package:get/get.dart';

import '../controllers/controllers.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
