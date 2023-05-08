import 'package:app/controller/root_controller.dart';
import 'package:app/root.dart';
import 'package:app/screens/attendance/attendance_detail_teacher.dart';
import 'package:app/screens/main/main_page.dart';
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
      title: 'Do-damDo-dam',
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      home: Root(),

      // bottom Navi를 유지하지 않을 때는 , GetPage를 사용해서 이동.
      // 로그인 하기 전일 때 처리하면 될듯.
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: MainPage(),
//       theme: ThemeData(fontFamily: 'Pretendard'),
//       // initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => LoginSelect()),
//         GetPage(
//           name: '/main',
//           page: () => MainPage(),
//           transition: Transition.rightToLeft),
//         GetPage(
//             name: '/login/teacher',
//             page: () => LoginTeacher(),
//             transition: Transition.rightToLeft),
//         GetPage(
//             name: '/signup/select',
//             page: () => SignupSelect(),
//             transition: Transition.rightToLeft),
//         GetPage(
//             name: '/signup/id',
//             page: () => SignupId(),
//             transition: Transition.rightToLeft),
//         GetPage(
//             name: '/signup/number',
//             page: () => SignupNumber(),
//             transition: Transition.rightToLeft),
//         GetPage(
//             name: '/notice',
//             page: () => NoticeList(),
//             transition: Transition.cupertino),
//         GetPage(
//             name: '/notice/detail',
//             page: () => NoticeDetail(),
//             transition: Transition.cupertino),
//         GetPage(
//             name: '/notice/regist',
//             page: () => NoticeRegist(),
//             transition: Transition.cupertino),
//         GetPage(
//             name: '/notice/image/:idx',
//             page: () => NoticeImageDetail(),
//             transition: Transition.cupertino),
//         GetPage(
//             name: '/attendance',
//             page: () => AttendanceList(),
//             transition: Transition.cupertino),
//         GetPage(
//             name: '/attendance/teacher',
//             page: () => AttendanceDetailTeacher(),
//             transition: Transition.cupertino),
//         GetPage(
//             name: '/attendance/parent',
//             page: () => AttendanceDetailParent(),
//             transition: Transition.cupertino),
//       ],
//     );
//   }
// }
