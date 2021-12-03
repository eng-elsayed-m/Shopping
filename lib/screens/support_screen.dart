import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  static const nv = "/support";
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("سياسة الدعم"),
        ),
        body: Center(
          child: Text("سياسة الدعم"),
        ));
  }
}
