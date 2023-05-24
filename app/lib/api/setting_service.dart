import 'dart:convert';
import 'package:app/api/http_header.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/models/code/add_class_model.dart';
import 'package:app/models/code/add_kid_model.dart';
import 'package:app/models/setting/class_list_model.dart';
import 'package:app/models/setting/kid_list_model.dart';
import 'package:app/models/setting/sleep_mode_time_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SettingService {
  static Future<List<AddClass>> getClassList() async {
    try {
      String URL = '${url}/user/class';
      final res = await http.get(
          Uri.parse(URL),
          headers: authGetHeaders
      );
      if(res.statusCode == 200) {
        List<AddClass> classList = classListModelFromJson(utf8.decode(res.bodyBytes)).classList;
        return classList;
      }else{
        return [];
      }
    } catch(e) {
      print(e);
      return [];
    }
  }

  static Future<List<AddKid>> getKidList() async {
    try {
      String URL = '${url}user/kid';
      final res = await http.get(
          Uri.parse(URL),
          headers: authGetHeaders
      );
      if(res.statusCode == 200) {
        List<AddKid> kidList = kidListModelFromJson(utf8.decode(res.bodyBytes)).kidList;
        return kidList;
      }else{
        return [];
      }
    } catch(e) {
      print(e);
      return [];
    }
  }

  // 방해 금지 설정 시간 받아오기
  static Future<SleepModeTime> getSleepModeTime() async {
    try {
      String URL = '${url}/user/userSleepMode';
      final res = await http.get(Uri.parse(URL), headers: authGetHeaders);
      if(res.statusCode == 200){
        SleepModeTime time = sleepModeTimeModelFromJson(utf8.decode(res.bodyBytes)).sleepModeTime;
        return time;
      }
      return SleepModeTime(sleepModeStart: '', sleepModeEnd: '');
    } catch(e) {
      print(e);
      return SleepModeTime(sleepModeStart: '', sleepModeEnd: '');
    }
  }

  // 방해금지모드 수정
  static Future<void> modifySleepModeTime(SleepModeTime time) async {
    SettingController sc = Get.put(SettingController());
    try {
      Map<String, String> data = {
        "sleepModeStart" : time.sleepModeStart,
        "sleepModeEnd" : time.sleepModeEnd
      };
      String URL = '${url}/user/userSleepMode';
      final res = await http.put(
          Uri.parse(URL),
          headers: authPostHeaders,
          body: jsonEncode(data)
      );
      if(res.statusCode == 200) {
        sc.setSleepTimeMode();
      }
    } catch(e) {
      print(e);
    }
  }
}