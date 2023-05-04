import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/api/url_mapping.dart';

class ScheduleService {
  static Future<List<OneSchedule>> getOneDayScheduleList(String year, String month, String day) async{
    try{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setInt('classSeq', 1); // 얘는 임시로 테스트용.
      int? classSeq = pref.getInt('classSeq'); // 디바이스에서 classSeq 정보를 받아온다.
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