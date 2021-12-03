import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  static const nv = "/privacy";
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("سياسة الخصوصية"),
        ),
        body: Center(
          child: Text("سياسة الخصوصية"),
        ));
  }
}
