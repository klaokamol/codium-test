import 'package:flutter/material.dart';
import 'package:flutter_codium_test/contoller/login_page_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final String pageName;
  const LoginPage({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginPageCtrl = Get.put(LoginPageController(context: context));
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: SafeArea(
          bottom: true,
          child: Form(
            key: loginPageCtrl.formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                        'https://codium.co/static/images/locodium-white.webp'),
                  ),
                  const SizedBox(height: 20),
                  const TextBox(
                    isPassword: false,
                  ),
                  const TextBox(
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        loginPageCtrl.checkUser();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: double.maxFinite,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          alignment: Alignment.center,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class TextBox extends StatelessWidget {
  final bool isPassword;
  const TextBox({Key? key, required this.isPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageCtrl = Get.find();
    return Container(
      width: double.maxFinite,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            isPassword ? Icons.password_outlined : Icons.email_outlined,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: isPassword
                    ? loginPageCtrl.passwordTC
                    : loginPageCtrl.usernameTC,
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: isPassword ? " Password ..." : " E-mail ...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return isPassword
                        ? 'Please enter password'
                        : 'Please enter username';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
