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
      String URL = c.isTeacher ? '${url}class/noticeByTeacher/${c.classSeq}' : '${url}class/noticeByParent/${c.kidSeq}';
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

  // 선택한 월에 해당하는 알림장 리스트
  static Future<List<NoticeListItem>> getNoticeListByMonth (int year, int month) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      String URL = c.isTeacher
          ? '${url}class/noticeSearchByTeacher?classSeq=${c.classSeq}&year=$year&month=$month'
          : '${url}class/noticeSearchByParent?kidSeq=${c.kidSeq}&year=$year&month=$month';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode == 200) {
        List<NoticeListItem> noticeList = noticeListModelFromJson(utf8.decode(res.bodyBytes)).noticeList;
        return noticeList;
      }else{
        return [];
      }
    } catch (e) {
      print(e);
      return [];
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
      String URL = '${url}class/notice';
      var req = http.MultipartRequest('POST', Uri.parse(URL));
      req.fields['classSeq'] = c.classSeq.toString();
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

  // 반 별 원생 리스트 함수
  static Future<List<ClassKid>> getClassKidList() async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      String URL = '${url}class/notice/kid/${c.classSeq}';
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