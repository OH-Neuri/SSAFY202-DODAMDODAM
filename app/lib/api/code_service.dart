import 'dart:convert';
import 'package:app/api/http_header.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/code/add_class_model.dart';
import 'package:app/models/code/add_kid_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';

class CodeService {
  static Future<bool> authClassCode (String code) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    Map<String, String> data = {
      "phone" : c.phone,
      "code" : code,
    };
    print(jsonEncode(data));
    try {
      String URL = '${url}sms/teacher/check';
      final res = await http.post(
          Uri.parse(URL),
          headers: authPostHeaders,
          body: jsonEncode(data)
      );
      if(res.statusCode == 200){
        AddClass addClass = addClassModelFromJson(utf8.decode(res.bodyBytes)).addClass;
        c.classSetting(addClass);
        print('코드 인증 성공');
        return true;
      }
      print('코드 인증 실패');
      print(res.statusCode);
      return false;
    } catch (e) {
      print(e);
      print('통신 실패');
      return false;
    }
  }

  static Future<bool> authKidCode (String code) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    Map<String, String> data = {
      "phone" : c.phone,
      "code" : code,
    };
    print(jsonEncode(data));
    try {
      String URL = '${url}sms/parent/check';
      final res = await http.post(
          Uri.parse(URL),
          headers: authPostHeaders,
          body: jsonEncode(data)
      );
      if(res.statusCode == 200){
        AddKid addKid = addKidModelFromJson(utf8.decode(res.bodyBytes)).addKid;
        c.kidSetting(addKid);
        print('코드 인증 성공');
        return true;
      }
      print('코드 인증 실패');
      print(res.statusCode);
      return false;
    } catch (e) {
      print(e);
      print('통신 실패');
      return false;
    }
  }
}