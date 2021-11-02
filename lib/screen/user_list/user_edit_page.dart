import 'package:flutter/material.dart';
import 'package:flutter_codium_test/config.dart';
import 'package:flutter_codium_test/contoller/user_list_controller.dart';
import 'package:flutter_codium_test/model/user_model.dart';
import 'package:get/get.dart';

class UserProfileEdit extends StatelessWidget {
  final Users user;
  final int index;
  const UserProfileEdit({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserListPageController userPageCtrl = Get.find();
    userPageCtrl.initData(index);

    Widget _buildTextField(
        String label, String hintText, TextEditingController textEdit) {
      bool check = label == 'Address';
      return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: AppConfig().fontL, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                height: check ? 200 : 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  controller: textEdit,
                  maxLines: check ? 3 : 1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {
                  userPageCtrl.updateProfile(index);
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: AppConfig().fontL),
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150.0),
                  child: Image.network(
                    user.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          _buildTextField('Name', user.name, userPageCtrl.nameTC),
          _buildTextField('E-mail', user.email, userPageCtrl.emailTC),
          _buildTextField('Brith Date', user.birthday, userPageCtrl.brithdayTC),
          _buildTextField('Address', user.address, userPageCtrl.addressTC)
        ],
      ),
    );
  }
}
