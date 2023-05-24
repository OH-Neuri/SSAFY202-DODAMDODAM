import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final notifications = FlutterLocalNotificationsPlugin();


//1. 앱로드시 실행할 기본설정
initNotification() async {
  print('노티 세팅');
  //안드로이드용 아이콘파일 이름
  var androidSetting = AndroidInitializationSettings('app_icon');

  var initializationSettings = InitializationSettings(
    android: androidSetting,
  );
  await notifications.initialize(
    initializationSettings,
    //알림 누를때 함수실행하고 싶으면
    //onSelectNotification: 함수명추가
  );
}

//2. 이 함수 원하는 곳에서 실행하면 알림 뜸
showNotification(int type, String content) async {
  var androidDetails = AndroidNotificationDetails(
    '$type',
    content,
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );

  String typeTitle = '';
  if(type == 1) {
    typeTitle = '[알림장]';
  }else if(type == 2) {
    typeTitle = '[등하원 확인]';
  }else {
    typeTitle = '[투약 확인]';
  }
  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(
      1,
      typeTitle,
      content,
      NotificationDetails(android: androidDetails,)
  );
}