import 'package:app/api/chatting_service.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/chatting/chatting_teacher_list_model.dart';
import 'package:app/models/chatting/chatting_user_list_model.dart';
import 'package:get/get.dart';

class ChattingController extends GetxController {
  static ChattingController get to => Get.find();

  // 채팅 메인 사이트에서
  // 사용자 목록 -> false, 채팅 리스트 -> true
  bool isChattingList = false;
  List<SingleUser> userList = <SingleUser>[];
  List<SingleTeacher> teacherList = <SingleTeacher>[];

  @override
  void onInit() async {
    if (DeviceInfoController.to.isTeacher) {
      userList = await ChattingService.getChatUserList();
    }
    else {
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