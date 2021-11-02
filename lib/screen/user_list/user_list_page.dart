import 'package:flutter/material.dart';
import 'package:flutter_codium_test/config.dart';
import 'package:flutter_codium_test/contoller/user_list_controller.dart';
import 'package:flutter_codium_test/model/user_model.dart';
import 'package:get/get.dart';

import 'user_edit_page.dart';

class UserList extends StatelessWidget {
  final String pageName;
  const UserList({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPageCtrl = Get.put(UserListPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView.builder(
            itemCount: userPageCtrl.userList.length,
            itemBuilder: (context, index) {
              return ProfileCard(
                index: index,
              );
            }),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final int index;
  const ProfileCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserListPageController userPageCtrl = Get.find();

    return Obx(
      () {
        Users user = userPageCtrl.userList[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => UserProfileEdit(
                  user: user,
                  index: index,
                ));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        user.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppConfig().fontL)),
                      Text(user.email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppConfig().fontL)),
                      Text(
                        user.address,
                        style: TextStyle(
                            fontSize: AppConfig().fontM, color: Colors.black38),
                        maxLines: 3,
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
