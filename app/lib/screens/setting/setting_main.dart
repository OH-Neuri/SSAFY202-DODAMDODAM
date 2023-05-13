import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/main.dart';
import 'package:app/screens/user/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingMain extends StatelessWidget {
  const SettingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 로그아웃 버튼
        InkWell(
          onTap: () {
            DeviceInfoController.to.setIsLogin(false);
            Get.offAll(LoginSelect());
          },
          child: Container(
            width: 100, height: 100,
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(child: Text("로그아웃")),
          ),
        )
      ],
    );
  }
}
