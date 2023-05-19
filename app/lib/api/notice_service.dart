import 'dart:convert';
import 'dart:io';
import 'package:app/api/notify_service.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/notice/class_kid_list_model.dart';
import 'package:app/models/notice/notice_detail_model.dart';
import 'package:app/models/notice/notice_regist_response_model.dart';
import 'package:app/utils/keyword_to_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/models/notice/notice_list_model.dart';

class NoticeService {
  // 알림장 목록 페이지
  static Future<List<NoticeListItem>> getNoticeList() async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      c.setClassSeq(1); // 임시
      int classSeq = c.classSeq;
      int kidSeq = 3; // 임시
      // int kidSeq = c.kidSeq; // 추후에 로그인 다시 구현 .......
      String URL = c.isTeacher
          ? '${url}class/noticeByTeacher/$classSeq'
          : '${url}class/noticeByParent/$kidSeq';
      final res = await http.get(Uri.parse(URL));

      if (res.statusCode == 200) {
        final List<NoticeListItem> noticeList =
            noticeListModelFromJson(utf8.decode(res.bodyBytes)).noticeList;
        return noticeList;
      } else {
        return <NoticeListItem>[];
      }
    } catch (e) {
      print(e);
      return <NoticeListItem>[];
    }
  }

  // 알림장 상세 페이지
  static Future<NoticeDetail> getNoticeDetail(int noticeSeq) async {
    try {
      String URL = '${url}class/notice/info/$noticeSeq';
      final res = await http.get(Uri.parse(URL));
      if (res.statusCode == 200) {
        final NoticeDetail noticeDetail =
            noticeDetailModelFromJson(utf8.decode(res.bodyBytes)).noticeDetail;
        return noticeDetail;
      } else {
        return NoticeDetail(
            noticeSeq: 0,
            date: '',
            content: '',
            announcement: true,
            photo: [],
            kid: []);
      }
    } catch (e) {
      print(e);
      return NoticeDetail(
          noticeSeq: 0,
          date: '',
          content: '',
          announcement: true,
          photo: [],
          kid: []);
    }
  }

  // 알림장 등록 함수
  static Future<void> registNotice(int classSeq, bool announcement,
      String content, List<int> kids, List<File> photos) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      c.setClassSeq(1); // 로그인 할 때, 저장
      int? classSeq = c.classSeq;
      String URL = '${url}class/notice';
      var req = http.MultipartRequest('POST', Uri.parse(URL));
      req.headers['Authorization'] = 'Bearer ${c.token}';
      req.fields['classSeq'] = c.classSeq.toString();
      req.fields['announcement'] = announcement.toString();
      req.fields['content'] = content;
      req.fields['kid'] = kids.join(',');
      for (int i = 0; i < photos.length; i++) {
        File image = photos[i];
        req.files.add(await http.MultipartFile.fromPath('photos', image.path));
      }
      // for (int i = 0; i < photos.length; i++) {
      //   File image = photos[i];
      //   List<int> bytes = await image.readAsBytes();
      //   String fileName = image.path.split('/').last;
      //   req.files.add(http.MultipartFile.fromBytes('photos', bytes, filename: fileName));
      // }
      var res = await req.send();
      if (res.statusCode == 200) {
        nc.setNoticeList();
        nc.setSelectKidClear();
        String responseString = await res.stream.bytesToString();
        List<NotifyModel> notify =
            noticeRegistResponseModelFromJson(responseString).notifyModel;
        for (NotifyModel n in notify) {
          NotifyService.sendNotify(n);
        }
      } else {
        print('여기는 실패야');
        print(res.statusCode);
      }
      print(res.statusCode);
    } catch (e) {
      print('아예 여기라고?');
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
      c.setClassSeq(1);
      int classSeq = c.classSeq;
      String URL = '${url}class/notice/kid/$classSeq';
      final res = await http.get(Uri.parse(URL));
      if (res.statusCode == 200) {
        final List<ClassKid> classKidList =
            classKidListModelFromJson(utf8.decode(res.bodyBytes)).classKid;
        return classKidList;
      } else {
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
      String token =
          'Bearer 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';
      String url =
          "https://api.openai.com/v1/engines/text-davinci-003/completions";
      String text = keywordToText(keywords);
      Map<String, dynamic> data = {
        "prompt":
            "나는 유치원 선생님이고, 학부모들에게 보낼 알림장을 작성할꺼야. 시작문구는 다음과 같아. [안녕하세요 화창한 여름날입니다.] 그리고, 다음과 같은 키워드들을 사용해서 이어서 작성해줘, [$text ]",
        "temperature": 1.0,
        "max_tokens": 1000,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      };
      final res = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": token,
          },
          body: jsonEncode(data));
      if (res.statusCode == 200) {
        String text =
            aiResponseModelFromJson(utf8.decode(res.bodyBytes)).choices[0].text;
        return text;
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }
}
