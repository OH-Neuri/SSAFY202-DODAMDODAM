import 'package:get/get.dart';

class CalendarTypeController extends GetxController {
  static CalendarTypeController get to => Get.find();

  // 채팅 메인 사이트에서
  // 사용자 목록 -> false, 채팅 리스트 -> true
  bool isChattingList = false;
  List<SingleUser> userList = <SingleUser>[];
  List<SingleTeacher> teacherList = <SingleTeacher>[];

  @override
  void onInit() async {
    if (DeviceInfoController.to.isTeacher) {
      userList = await ChattingService.getChatUserList();
    } else {
      teacherList = await ChattingService.getChatTeacherList();
    }
    super.onInit();
    update();
  }

  void setIsChattingList(value) {
    isChattingList = value;
    update();
  }
}
