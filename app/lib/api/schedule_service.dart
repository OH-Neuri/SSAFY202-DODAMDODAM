import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';

class ScheduleService {
  static Future<List<OneSchedule>> getOneDayScheduleList(String year, String month, String day) async{
    DeviceInfoController c = Get.put(DeviceInfoController());
    try{
      c.setClassSeq(1); // 로그인 할 때, 저장
      int? classSeq = c.classSeq.value;
      String URL = '${url}class/schedule/$classSeq?year=$year&month=$month&day=$day';
      final response = await http.get(Uri.parse(URL));

      if(response.statusCode == 200){
        final List<OneSchedule> scheduleList = sigledayScheduleFromJson(utf8.decode(response.bodyBytes)).oneSchedule;
        return scheduleList;
      }else {
        print('Error 발생 <OneSchedule>[] return ');
        return <OneSchedule>[];
      }
    }catch(e){
      print(e);
      return <OneSchedule>[];
    }
  }
}