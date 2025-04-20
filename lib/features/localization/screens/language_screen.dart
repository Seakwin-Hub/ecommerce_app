import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        height: 19,
        color: Colors.black,
        child: Text(
          "sign_in".tr,
          style: TextStyle().copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
