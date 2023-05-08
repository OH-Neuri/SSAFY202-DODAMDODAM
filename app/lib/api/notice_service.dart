import 'dart:convert';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/models/notice/notice_list_model.dart';

class NoticeService {
  static Future<List<NoticeListItem>> getNoticeList() async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try{
      c.setClassSeq(1); // 로그인 할 때, 저장
      int? classSeq = c.classSeq.value;
      String URL = '${url}class/notice/$classSeq';
      final res = await http.get(Uri.parse(URL));

      if (res.statusCode == 200) {
        final List<NoticeListItem> noticeList = noticeListModelFromJson(utf8.decode(res.bodyBytes)).noticeList;
        print('통신 성공!');
        return noticeList;
      }else{
        print('error 발생');
        return<NoticeListItem>[];
      }
    }catch(e){
      print(e);
      print('통신 실패!!!!');
      return <NoticeListItem>[];
    }

  }
}