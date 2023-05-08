import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 페이지 이동을 처리해줄 컨트롤러
class RootController extends GetxController {
  // 어디서든지 컨트롤러 호출 가능하게
  static RootController get to => Get.find();

  RxInt rootPageIndex = 0.obs;

  final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> chatNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> calendarNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> settingNavigatorKey = GlobalKey<NavigatorState>();
  RxBool isCategoryPageOpen = false.obs;

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }

  Future<bool> onWillPop() async {
    // pop 할게 있으면 false, 아니면 true
    // 뒤로 계속 가면 앱 꺼짐. 근데 pop할 게 있으면 뒤로 감.
    // setCategoryPage(false);
    // return !await navigatorKey.currentState!.maybePop();
    // 근데 페이지마다 어떻게 처리해야 할 지 모르겠네..
    return false;
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