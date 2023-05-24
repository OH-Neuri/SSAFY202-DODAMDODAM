import 'dart:convert';

import 'package:app/api/http_header.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/models/notice/notice_regist_response_model.dart';
import 'package:http/http.dart' as http;

class NotifyService {
  static void sendNotify(NotifyModel notify) async {
    try {
      String URL = '${baseUrl}notify';
      final res = await http.post(
          Uri.parse(URL),
          headers: postHeaders,
          body: jsonEncode(notify.toJson())
      );
      if (res.statusCode == 200) {
        print('알림성공');
      }else{
        print('알림실패');
      }
    } catch(e) {
      print(e);
    }
  }
}