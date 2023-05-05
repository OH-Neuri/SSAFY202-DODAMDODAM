import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastClass {
  static void showToast(String msg) {
    print('실행');
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0x70FF0000),
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}