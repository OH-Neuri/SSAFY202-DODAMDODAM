import 'package:app/screens/attendance/attendance_detail_teacher.dart';
import 'package:app/screens/medicine/medicine_parent_detail_page.dart';
import 'package:app/screens/medicine/medicine_parent_page.dart';
import 'package:app/screens/medicine/medicine_teacher_detail_page.dart';
import 'package:app/screens/medicine/medicine_teacher_page.dart';
import 'package:app/screens/notice/notice_detail.dart';
import 'package:app/screens/notice/notice_image_detail.dart';
import 'package:app/screens/notice/notice_list.dart';
import 'package:app/screens/notice/notice_regist.dart';
import 'package:app/screens/user/login_select.dart';
import 'package:app/screens/user/login_teacher.dart';
import 'package:app/screens/attendance/attendance_list.dart';
import 'package:app/screens/attendance/attendance_detail_parent.dart';

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
      home: MedicineTeacherDetailPage(),
      theme: ThemeData(fontFamily: 'Pretendard'),
      // initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginSelect()),
        GetPage(
            name: '/login/teacher',
            page: () => LoginTeacher(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/signup/select',
            page: () => SignupSelect(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/signup/id',
            page: () => SignupId(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/signup/number',
            page: () => SignupNumber(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/notice',
            page: () => NoticeList(),
            transition: Transition.cupertino),
        GetPage(
            name: '/notice/detail',
            page: () => NoticeDetail(),
            transition: Transition.cupertino),
        GetPage(
            name: '/notice/regist',
            page: () => NoticeRegist(),
            transition: Transition.cupertino),
        GetPage(
            name: '/notice/image/:idx',
            page: () => NoticeImageDetail(),
            transition: Transition.cupertino),
        GetPage(
            name: '/attendance',
            page: () => AttendanceList(),
            transition: Transition.cupertino),
        GetPage(
            name: '/attendance/teacher',
            page: () => AttendanceDetailTeacher(),
            transition: Transition.cupertino),
        GetPage(
            name: '/attendance/parent',
            page: () => AttendanceDetailParent(),
            transition: Transition.cupertino),
        GetPage(
            name: '/medicine/teacher',
            page: () => MedicineTeacherPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/medicine/teacher/detail',
            page: () => MedicineTeacherDetailPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/medicine/parent',
            page: () => MedicineParentPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/medicine/parent/detail',
            page: () => MedicineParentDetailPage(),
            transition: Transition.cupertino),
      ],
    );
  }
}
