import 'dart:convert';
import 'dart:io';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/models/notice/ai_response_model.dart';
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
    NoticeController nc = Get.put(NoticeController());
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
        print('알림장 등록 성공했다우');
        nc.setNoticeList();
        nc.setSelectKidClear();
      } else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  // 알림장 삭제
  static Future<void> deleteNotice(int noticeSeq) async {
    NoticeController nc = Get.put(NoticeController());
    try {
      String URL = '${url}class/notice/$noticeSeq';
      final res = await http.delete(Uri.parse(URL));
      if (res.statusCode == 200) {
        nc.setNoticeList();
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

  // 자동완성
  static Future<String> generateNotice(List<String> keywords) async {
    try {
      String token = 'Bearer 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';
      String url = "https://api.openai.com/v1/engines/text-davinci-003/completions";
      Map<String, dynamic> data = {
        "prompt" : "너는 유치원 선생님이야 다음과 같은 키워드들로 알림장을 작성해줘, '봄소풍', '준비물은 도시락', '9시에 출발 16시에 도착예정'",
        "temperature" : 1.0,
        "max_tokens" : 300,
        "top_p" : 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      };
      final res = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(data)
      );
      if(res.statusCode == 200) {
        String text = aiResponseModelFromJson(utf8.decode(res.bodyBytes)).choices[0].text;
        return text;
      }
      return '';

    }catch (e) {
      print(e);
      return '';
    }

  }
}