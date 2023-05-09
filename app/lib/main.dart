import 'package:app/controller/root_controller.dart';
import 'package:app/root.dart';
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

