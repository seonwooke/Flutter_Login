import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../constants/routes/routes.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser ;
    if (currentUser != null) {
      Get.offNamed(AppRoutes.instance.HOME) ;
    } else {
      Get.offNamed(AppRoutes.instance.SIGNIN) ;
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
