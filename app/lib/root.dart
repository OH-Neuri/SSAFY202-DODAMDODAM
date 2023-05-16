import 'package:app/constants.dart';
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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              currentIndex: controller.rootPageIndex.value,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 20,
              type: BottomNavigationBarType.fixed,
              fixedColor: textColor,
              onTap: (index) => controller.navigateToRootPage(index),
              items: [
                // 메인
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey[500]),
                  activeIcon: ActiveIconCustom(icon: Icon(Icons.home, color: Colors.grey[800]),),
                  label: "메인",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month, color: Colors.grey[500]),
                  activeIcon: ActiveIconCustom(icon: Icon(Icons.calendar_month, color: Colors.grey[800]),),
                  label: "캘린더",
                ),
                // 채팅
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat, color: Colors.grey[500]),
                  activeIcon: ActiveIconCustom(icon: Icon(Icons.chat, color: Colors.grey[800]),),
                  label: "채팅",
                ),
                // 환경 설정
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Colors.grey[500]),
                  activeIcon: ActiveIconCustom(icon: Icon(Icons.settings, color: Colors.grey[800]),),
                  label: "환경설정",
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}

class ActiveIconCustom extends StatelessWidget {
  final Icon icon;

  const ActiveIconCustom({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: textColor, width: 3))
      ),
        child: Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 3),
          child: icon,
        )
    );
  }
}
