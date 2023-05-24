import 'package:app/controller/notice_controller.dart';
import 'package:get/get.dart';

String kidLengthToText(List<String> kid) {
  NoticeController nc = Get.put(NoticeController());
  int l = nc.kidList.length;
  if (l == kid.length) {
    return '@전체원생';
  }
  if (kid.length == 1) {
    return '@${kid[0]}';
  }
  return '@${kid[0]} 외 ${kid.length - 1}명';
}