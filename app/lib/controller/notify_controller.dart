import 'dart:async';

import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/chatting/notify_model.dart';
import 'package:app/notification.dart';
import 'package:get/get.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:http/http.dart' as http;

class NotifyController extends GetxController {
  static NotifyController get to => Get.find();

  List<NotifyReceive> notifyList = [];

  @override
  void onInit() {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    // String Url = 'http://localhost:9998/notify/${dc.token}';
    String Url = 'http://70.12.246.34:9998/notify/${dc.token}';
    print('$Url 실행한다.------------------------');
    SSEClient.subscribeToSSE(
        url: Url,
        header: {
          "Accept": "text/event-stream",
        }).listen((event) {
          // event 받으면 실행되는 부분
          var receive = notifyReceiveFromJson(event.data as String);
          showNotification();
          notifyList.add(receive);
          update();
    });
    super.onInit();
  }

  void readAlarm(String noSeq, int uSeq, int index) async {
   String Url = "http://70.12.246.34:9998/notify";
   try {
     await http.put(
         Uri.parse(Url),
         body: {
           "notifySeq" : noSeq,
           "userSeq" : uSeq.toString()
         }
     );
   } catch (e) {
     print('알림 읽음 오류 $e');
   }
   notifyList.removeAt(index);
   update();
  }


}