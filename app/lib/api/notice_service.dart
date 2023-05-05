import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/models/notice/notice_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeService {
  static Future<List<NoticeListItem>> getNoticeList() async {
    try{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setInt('classSeq', 1); // 로그인 할 때, 저장
      int? classSeq = pref.getInt('classSeq');
      String URL = '${url}class/notice/$classSeq';
      print(URL);
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