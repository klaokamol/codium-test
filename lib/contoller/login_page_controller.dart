import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codium_test/screen/blank_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final _username = 'CODIUM';
  final _password = 'CODIUM';
  final formKey = GlobalKey<FormState>();
  final BuildContext context;
  LoginPageController({required this.context});

  TextEditingController usernameTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();

  void checkUser() {
    if (formKey.currentState!.validate()) {
      if (usernameTC.text == _username && passwordTC.text == _password) {
        EasyLoading.show(status: 'loading...');
        Future.delayed(const Duration(milliseconds: 500), () {
          EasyLoading.dismiss();
          Get.off(() => const BlankPage());
        });
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Alert',
          desc: 'Username or password is incorrect.',
          btnOkOnPress: () {},
        ).show();
      }
    }
  }
}
