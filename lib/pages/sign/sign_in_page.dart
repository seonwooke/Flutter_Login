import 'package:flutter/material.dart';
// import 'package:flutter_login/services/auth/auth.dart';
// import 'package:flutter_login/services/auth/kakao_login.dart';
import 'package:get/get.dart';

import '../../constants/utils/utils.dart';
import '../../controllers/controllers.dart';
import '../../test/test.dart';
import '../pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final signController = Get.put(SignController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }

  _appBarWidget() {
    return AppBar(
      title: const Text('LOGIN'),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Obx(() {
              return signController.loging.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Email TextField
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                validator: ((value) {
                                  if (value!.trim().isEmpty) {
                                    return '이메일을 입력하세요.';
                                  } else if (!value.isEmail) {
                                    return '이메일 형식이 잘못되었습니다.';
                                  } else {
                                    return null;
                                  }
                                }),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// Password TextField
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 24.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextFormField(
                                controller: _passwordController,
                                autocorrect: false,
                                obscureText: true,
                                validator: ((value) {
                                  if (value!.trim().isEmpty) {
                                    return '패스워드 입력하세요.';
                                  } else {
                                    return null;
                                  }
                                }),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// Sign in Button
                        GestureDetector(
                          onTap: () async {
                            // if (_formKey.currentState!.validate()) {
                            //   signController.start();
                            //   await Authentication.instance
                            //       .signInWithEmailAndPassword(
                            //     _emailController.text.trim(),
                            //     _passwordController.text.trim(),
                            //   );
                            //   signController.done();
                            // }
                          },
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// Register Button
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Not a member?'),
                              GestureDetector(
                                onTap: () => Get.to(() => SignUpPage()),
                                child: const Text(
                                  ' Register Now!',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),

                        /// Social SNS Login Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// Google
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: () {
                                  signController.start();
                                  // GoogleLogin().signIn();
                                },
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Image.asset(
                                    AssetsUtils.instance.google,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ),

                            /// Kakao
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 20.0),
                              child: InkWell(
                                onTap: () async {
                                  signController.start();
                                  // KakaoLogin().signIn();
                                  KakaoLogin().login();
                                },
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Image.asset(
                                    AssetsUtils.instance.kakao,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
