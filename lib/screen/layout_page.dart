import 'package:flutter/material.dart';
import 'package:flutter_codium_test/config.dart';

class LayoutTestPage extends StatelessWidget {
  final String pageName;
  const LayoutTestPage({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildContainer(String text, Color? color, bool expanded) {
      return expanded
          ? Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  color: color,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: AppConfig().fontM, color: Colors.white),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                color: color,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: AppConfig().fontM, color: Colors.white),
                ),
              ),
            );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: SafeArea(
        bottom: true,
        child: Column(children: [
          Row(
            children: [
              _buildContainer('LOGO', Colors.cyan[700], false),
              _buildContainer('TOP MENU', Colors.brown[700], true),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                _buildContainer('LEFT MENU', Colors.teal[600], false),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      _buildContainer('HEADER', Colors.grey[800], false),
                      Expanded(
                        child: Row(
                          children: [
                            _buildContainer(
                                'CONTENT', Colors.blueGrey[600], false),
                            _buildContainer('DETAIL', Colors.grey[500], true),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
