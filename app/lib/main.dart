import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/root_controller.dart';
import 'package:app/notification.dart';
import 'package:app/root.dart';
import 'package:app/screens/user/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    return GetMaterialApp(
      title: 'Do-damDo-dam',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      // home: Root()
      home: LoginSelect(),
    );
  }
}
