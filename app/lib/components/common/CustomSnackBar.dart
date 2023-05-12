import 'package:flutter/material.dart';

class CustomSnackBar {
  // error 발생시 스낵바
  static void errorSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Color(0xABFF2F00),
        duration: Duration(seconds: 2),
      ),
    );
  }
  // 확인용 스낵바
  static void alertSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Color(0xAB5765AA),
        duration: Duration(seconds: 2),
      ),
    );
  }
}