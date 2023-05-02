import 'package:app/screens/main/main_page.dart';
import 'package:app/screens/user/login_teacher.dart';
import 'package:app/screens/attendance/attendance_list.dart';
import 'package:app/screens/attendance/attendance_list_detail.dart';

import 'package:app/screens/user/signup.dart';
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
      home: MainPage(),
      theme: ThemeData(fontFamily: 'Pretendard'),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/signup', page: ()=>Signup(), transition: Transition.rightToLeft)
      ],
    );
  }
}
