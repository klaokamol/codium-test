import 'package:flutter/material.dart';
import 'package:flutter_codium_test/model/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class UserListPageController extends GetxController {
  RxList<Users> userList = [
    Users(
        name: 'Women 1',
        email: 'Women1@gmail.com',
        birthday: '11/11/1996',
        address:
            '10th Fl., Bangkok Land Building 47/569-576 Popular 3 Road, Banmai Sub-district, Pakkred District, Nonthaburi 11120',
        image:
            'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
    Users(
        name: 'Women 2',
        email: 'Women2@gmail.com',
        birthday: '11/11/1996',
        address:
            '10th Fl., Bangkok Land Building 47/569-576 Popular 3 Road, Banmai Sub-district, Pakkred District, Nonthaburi 11120',
        image:
            'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
    Users(
        name: 'Man 1',
        email: 'Man1@gmail.com',
        birthday: '11/11/1996',
        address:
            '10th Fl., Bangkok Land Building 47/569-576 Popular 3 Road, Banmai Sub-district, Pakkred District, Nonthaburi 11120',
        image:
            'https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
    Users(
        name: 'Man 2',
        email: 'Man2@gmail.com',
        birthday: '11/11/1996',
        address:
            '10th Fl., Bangkok Land Building 47/569-576 Popular 3 Road, Banmai Sub-district, Pakkred District, Nonthaburi 11120',
        image:
            'https://images.pexels.com/photos/3778212/pexels-photo-3778212.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
  ].obs;

  TextEditingController nameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController brithdayTC = TextEditingController();
  TextEditingController addressTC = TextEditingController();

  void initData(int index) {
    nameTC.text = userList[index].name;
    emailTC.text = userList[index].email;
    brithdayTC.text = userList[index].birthday;
    addressTC.text = userList[index].address;
  }

  void updateProfile(index) async {
    EasyLoading.show(status: 'loading...');
    userList[index].name = nameTC.text;
    userList[index].email = emailTC.text;
    userList[index].birthday = brithdayTC.text;
    userList[index].address = addressTC.text;
    userList.refresh();
    Future.delayed(const Duration(milliseconds: 500), () {
      EasyLoading.dismiss();
      Get.back();
    });
  }
}
