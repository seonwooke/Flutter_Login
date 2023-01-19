import 'package:flutter/material.dart';
import 'package:flutter_login/controllers/auth_controller.dart';
import 'package:flutter_login/services/auth/auth.dart';

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
          onPressed: () => Authentication.instance.signOut(),
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
