import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/controller/root_controller.dart';
import 'package:app/screens/chatting/chatting_main.dart';
import 'package:app/screens/main/main_page.dart';
import 'package:app/screens/setting/setting_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/calendar/calendar_page.dart';

class Root extends GetView<RootController> {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 뒤로가기 누를 때 앱 안꺼지게 잡아줄 이벤트
      onWillPop: controller.onWillPop,
      child: Obx(() => Scaffold(
        body: IndexedStack(
          index: controller.rootPageIndex.value,
          // 바텀 네비게이션 바에 들어갈 페이지 리스트 (메인, 채팅, 환경 설정)
          children: [
            Navigator(
              key: controller.mainNavigatorKey,
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(builder: (context) => MainPage());
              },
            ),
            Navigator(
              key: controller.calendarNavigatorKey,
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(builder: (context) => CalendarPage());
              },
            ),
            Navigator(
              key: controller.chatNavigatorKey,
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(builder: (context) => ChattingMain());
              },
            ),
            Navigator(
              key: controller.settingNavigatorKey,
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(builder: (context) => SettingMain());
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.rootPageIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: controller.changeRootPageIndex,
          items: [
            // 메인
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.red),
              label: "메인",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, color: Colors.grey),
              activeIcon: Icon(Icons.calendar_month, color: Colors.red),
              label: "캘린더",
            ),
            // 채팅
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.grey),
              activeIcon: Icon(Icons.chat, color: Colors.red),
              label: "채팅",
            ),
            // 환경 설정
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.grey),
              activeIcon: Icon(Icons.settings, color: Colors.red),
              label: "환경설정",
            ),
          ],
        ),
      ),
      ),
    );
  }
}
