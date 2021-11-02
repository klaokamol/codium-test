import 'package:flutter/material.dart';
import 'package:flutter_codium_test/config.dart';
import 'package:get/get.dart';

import 'layout_page.dart';
import 'login_page.dart';
import 'user_list/user_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void goToPage(int index, String text) {
    switch (index) {
      case 0:
        Get.to(() => LayoutTestPage(pageName: text));
        break;
      case 1:
        Get.to(() => LoginPage(pageName: text));
        break;
      case 2:
        Get.to(() => UserList(pageName: text));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        fixedSize: const Size(200, 20),
        textStyle: TextStyle(fontSize: AppConfig().fontM));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Codium Test',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              'Practices',
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    var text = 'Practice: ${index + 5}';
                    return Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {
                          goToPage(index, text);
                        },
                        child: Text(text),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
