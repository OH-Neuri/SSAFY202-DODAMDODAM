import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 페이지 이동을 처리해줄 컨트롤러
class RootController extends GetxController {
  // 어디서든지 컨트롤러 호출 가능하게
  static RootController get to => Get.find();

  RxInt rootPageIndex = 0.obs;
  int lastSelectedTabIndex = 0;

  final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> chatNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> calendarNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> settingNavigatorKey = GlobalKey<NavigatorState>();
  RxBool isCategoryPageOpen = false.obs;

  void changeRootPageIndex(int index) {
    lastSelectedTabIndex = index;
    rootPageIndex.value = index;
  }

  void navigateToRootPage(int index) {
    if (lastSelectedTabIndex == index) {
      switch (index) {
        case 0:
          mainNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
        case 1:
          calendarNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
        case 2:
          chatNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
        case 3:
          settingNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
      }
      rootPageIndex.value = index;
    }
    else {
      lastSelectedTabIndex = index;
      rootPageIndex.value = index;
    }
  }

  Future<bool> onWillPop() async {
    if (mainNavigatorKey.currentState!.canPop()) {
      mainNavigatorKey.currentState!.pop();
      return false;
    } else if (chatNavigatorKey.currentState!.canPop()) {
      chatNavigatorKey.currentState!.pop();
      return false;
    } else if (calendarNavigatorKey.currentState!.canPop()) {
      calendarNavigatorKey.currentState!.pop();
      return false;
    } else if (settingNavigatorKey.currentState!.canPop()) {
      settingNavigatorKey.currentState!.pop();
      return false;
    } else {
      return true;
    }
  }

// 화살표랑 타이틀 처리를 위한 것. 나중에 숫자로 바꿔서
// 동적으로 이름 또한 지정해줘야 할 것 같음
// 지금은 notice에만.
// void setCategoryPage(bool ck) {
//   isCategoryPageOpen(ck);
// }

// // 뒤로가기 버튼에 이벤트 달아줌
// void back() {
//   setCategoryPage(false);
//   onWillPop();
// }
}