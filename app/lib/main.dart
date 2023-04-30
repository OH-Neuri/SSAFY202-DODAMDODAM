import 'package:app/models/user/login_teacher.dart';
import 'package:app/screens/attendance/attendance_list.dart';
// import 'package:app/screens/user/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AttendanceList(),
      theme: ThemeData(fontFamily: 'Pretendard'),
    );
  }
}
