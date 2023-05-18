import 'dart:convert';
import 'package:app/api/http_header.dart';
import 'package:app/controller/today_controller.dart';
import 'package:app/models/schedule/schedule_type_model.dart';
import 'package:http/http.dart' as http;
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';

class ScheduleService {
  // 하루 일정 받아오기
  static Future<List<OneSchedule>> getOneDayScheduleList(int year, int month, int day) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try{
      int classSeq = c.classSeq;
      String URL = '${url}class/schedule/$classSeq?year=$year&month=$month&day=$day';
      final response = await http.get(Uri.parse(URL), headers: authGetHeaders);
      if(response.statusCode == 200){
        final List<OneSchedule> scheduleList = sigledayScheduleFromJson(utf8.decode(response.bodyBytes)).oneSchedule;
        return scheduleList;
      }else {
        print('$URL 오늘의 일정 에러 발생');
        return <OneSchedule>[];
      }
    }catch(e){
      print(e);
      return <OneSchedule>[];
    }
  }

  // 일정 분류 받아오기
  static Future<List<SingleType>> getTypeList() async {
    try{
      int classSeq = DeviceInfoController.to.classSeq;
      String URL = '${url}kindergarten/scheduleType/$classSeq';
      final response = await http.get(Uri.parse(URL));
      if(response.statusCode == 200) {
        final List<SingleType> typeList = scheduleTypeModelFromJson(
            utf8.decode(response.bodyBytes)).typeList;
        return typeList;
      } else {
        print('$URL 일정 분류 리스트 에러 발생');
        return <SingleType>[];
      }
    }catch(e) {
      print(e);
      return <SingleType>[];
    }
  }

  // 일정 등록하기
  static void addSchedule(SingleType choice, String name) async {
    try {
      DeviceInfoController c = Get.put(DeviceInfoController());
      TodayController tc = Get.put(TodayController());
      String URL = '${url}class/schedule/${c.classSeq}';
      final data = {
          "content": name,
          "date": "${tc.choiceDay.year}-05-${tc.choiceDay.day}",
          "scheduleTypeSeq": choice.scheduleTypeSeq
      };
      final response = await http.post(
          Uri.parse(URL),
          headers: postHeaders,
          body: jsonEncode(data)
      );
      if(response.statusCode == 200) {
        tc.setOneDayInfo(DateTime(tc.choiceDay.year, tc.choiceDay.month, tc.choiceDay.day));
      } else {
        print('일정 등록 실패!');
      }
    }catch(e) {
      print(e);
    }
  }

  // 일정 삭제하기
  static void deleteSchedule(int scheduleSeq) async {
    try {
      TodayController tc = Get.put(TodayController());
      String URL = '${url}kindergarten/schedule/$scheduleSeq';
      final response = await http.delete(Uri.parse(URL));
      if(response.statusCode == 200) {
        tc.setOneDayInfo(DateTime(tc.choiceDay.year, tc.choiceDay.month, tc.choiceDay.day));
      } else {
        print('일정 삭제 실패!');
      }
    } catch (e) {
      print(e);
    }
  }
}