import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/controllers/user_controller.dart';
import 'package:flutter_login/services/auth/auth.dart';

import '../../repositories/repositories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }

  _appBarWidget() {
    return AppBar(
      title: const Text('HOME'),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
          ),
          onPressed: () async {
            try {
              await UserRepository.instance.updateMyUserInfo();
              await Authentication.instance.signOut();
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          },
        )
      ],
    );
  }

  _bodyWidget() {
    return const Center(
      child: Text('Home'),
    );
  }
}
