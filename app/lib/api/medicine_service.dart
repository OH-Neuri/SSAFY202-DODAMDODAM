import 'dart:convert';
import 'package:app/controller/today_controller.dart';
import 'package:app/models/medicine/medicine_class_list_model.dart';
import 'package:app/models/medicine/medicine_kid_detail_model.dart';
import 'package:app/models/medicine/medicine_kid_month_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';

// class MedicineService {
//
//   static Future<List<MedicineClassList>> getMedicineClassList(int year, int month, int day) async {
//     DeviceInfoController c = Get.put(DeviceInfoController());
//     try{
//       int classSeq = c.classSeq;
//       String URL = '${url}class/schedule/$classSeq?year=$year&month=$month&day=$day';
//       final response = await http.get(Uri.parse(URL));
//       if(response.statusCode == 200){
//         final List<OneSchedule> scheduleList = sigledayScheduleFromJson(utf8.decode(response.bodyBytes)).oneSchedule;
//         return scheduleList;
//       }else {
//         print('$URL 오늘의 일정 에러 발생');
//         return <OneSchedule>[];
//       }
//     }catch(e){
//       print(e);
//       return <OneSchedule>[];
//     }
//   }
// }