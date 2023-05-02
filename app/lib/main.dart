import 'package:app/screens/notice/notice_list.dart';
import 'package:app/screens/user/login_select.dart';
import 'package:app/screens/user/login_teacher.dart';
// import 'package:app/screens/user/login_teacher.dart';
// import 'package:app/screens/attendance/attendance_list.dart';
// import 'package:app/screens/attendance/attendance_list_detail.dart';

import 'package:app/screens/user/signup_id.dart';
import 'package:app/screens/user/signup_number.dart';
import 'package:app/screens/user/signup_select.dart';
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
      home: NoticeList(),
      theme: ThemeData(fontFamily: 'Pretendard'),
      // initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>LoginSelect()),
        GetPage(name: '/login/teacher', page: ()=>LoginTeacher(), transition: Transition.rightToLeft),
        GetPage(name: '/signup/select', page: ()=>SignupSelect(), transition: Transition.rightToLeft),
        GetPage(name: '/signup/id', page: ()=>SignupId(), transition: Transition.rightToLeft),
        GetPage(name: '/signup/number', page: ()=>SignupNumber(), transition: Transition.rightToLeft),
        GetPage(name: '/notice', page: ()=>NoticeList(), transition: Transition.cupertino)
      ],
    );
  }
}
