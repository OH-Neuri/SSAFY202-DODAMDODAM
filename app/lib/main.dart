import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/root_controller.dart';
import 'package:app/root.dart';
import 'package:app/screens/user/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Do-damDo-dam',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
        Get.put(DeviceInfoController());
      }),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final SharedPreferences prefs = snapshot.data!;
          final bool isLogin = prefs.getBool('isLogin') ?? false;
          return isLogin ? Root() : LoginSelect();
        },
      ),
    );
  }
}

