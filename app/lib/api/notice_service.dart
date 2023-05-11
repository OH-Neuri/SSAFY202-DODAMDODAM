import 'dart:convert';
import 'dart:io';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/notice/class_kid_list_model.dart';
import 'package:app/models/notice/notice_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/models/notice/notice_list_model.dart';

class NoticeService {
  // 알림장 목록 페이지
  static Future<List<NoticeListItem>> getNoticeList() async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try{
      c.setClassSeq(1); // 임시
      int classSeq = c.classSeq;
      int kidSeq = 3; // 임시
      // int kidSeq = c.kidSeq; // 추후에 로그인 다시 구현 .......
      String URL = c.isTeacher ? '${url}class/noticeByTeacher/$classSeq' : '${url}class/noticeByParent/$kidSeq';
      final res = await http.get(Uri.parse(URL));

      if (res.statusCode == 200) {
        final List<NoticeListItem> noticeList = noticeListModelFromJson(utf8.decode(res.bodyBytes)).noticeList;
        return noticeList;
      }else{
        return<NoticeListItem>[];
      }
    }catch(e){
      print(e);
      return <NoticeListItem>[];
    }

  }
  // 알림장 상세 페이지
  static Future<NoticeDetail> getNoticeDetail(int noticeSeq) async {
    try {
      String URL = '${url}class/notice/info/$noticeSeq';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode == 200){
        final NoticeDetail noticeDetail = noticeDetailModelFromJson(utf8.decode(res.bodyBytes)).noticeDetail;
        return noticeDetail;
      }else{
        return NoticeDetail(noticeSeq: 0, date: '', content: '', announcement: true, photo: [], kid: []);
      }
    } catch(e) {
      print(e);
      return NoticeDetail(noticeSeq: 0, date: '', content: '', announcement: true, photo: [], kid: []);
    }
  }

  // 알림장 등록 함수
  static Future<void> registNotice(int classSeq, bool announcement, String content, List<int> kids, List<File> photos) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      c.setClassSeq(1); // 로그인 할 때, 저장
      int? classSeq = c.classSeq.value;
      String URL = '${url}class/notice';
      var req = http.MultipartRequest('POST', Uri.parse(URL));
      req.fields['classSeq'] = classSeq.toString();
      req.fields['announcement'] = announcement.toString();
      req.fields['content'] = content;
      for(int kid in kids) {
        req.fields['kid'] = kid.toString();
      }
      for (var image in photos) {
        req.files.add(await http.MultipartFile.fromPath('photos', image.path));
      }
      var res = await req.send();
      if (res.statusCode == 200) {

      }
      print(res.statusCode);
    } catch (e) {
      print(e);
    }
  }

  // 알림장 삭제
  static Future<void> deleteNotice(int noticeSeq) async {
    try {
      String URL = '${url}class/notice/$noticeSeq';
      final res = await http.delete(Uri.parse(URL));
      if (res.statusCode == 200) {
        print('삭제 성공');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<ClassKid>> getClassKidList() async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      c.setClassSeq(1);
      int classSeq = c.classSeq;
      String URL = '${url}class/notice/kid/$classSeq';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode == 200) {
        final List<ClassKid> classKidList = classKidListModelFromJson(utf8.decode(res.bodyBytes)).classKid;
        return classKidList;
      }else{
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}