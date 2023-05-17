import 'dart:convert';
import 'package:app/api/http_header.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:app/controller/today_controller.dart';
import 'package:app/models/medicine/medicine_class_list_model.dart';
import 'package:app/models/medicine/medicine_kid_detail_model.dart';
import 'package:app/models/medicine/medicine_kid_month_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicineService {

  // 반별 투약 확인서 리스트 가져오기 (선생님용) - 32
  static Future<List<MedicineClassList>> getMedicineClassList(DateTime day) async {
    // request
    //{
    //     "day": "2023-05-09"
    // }

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      String URL = '${url}medicine/class/${c.classSeq}';
      final data = {
        "day" : DateFormat('yyyy-MM-dd').format(day),
      };
      final res = await http.post(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)

      );
      if(res.statusCode == 200){
        final List<MedicineClassList> medicineClassList = medicineClassListModelFromJson(utf8.decode(res.bodyBytes)).medicineClassList;
        // print("32 통신 성공");
        return medicineClassList;
      }else {
        // print("32 통신 실패 error");
        return <MedicineClassList>[];
      }
    }catch(e){
      // print("32 통신 실패 catch");
      print(e);
      return <MedicineClassList>[];
    }
  }


  // 투약 확인서 상세 페이지 (선생님&학부모) - 33
  static Future<MedicineKidDetail> getMedicineDetail(int medicineSeq) async {

    try {
      String URL = '${url}medicine/${medicineSeq}';
      final res = await http.get(Uri.parse(URL));
      // print("33 통신 시작");
      if(res.statusCode == 200){
        final MedicineKidDetail medicineKidDetail = medicineKidDetailModelFromJson(utf8.decode(res.bodyBytes)).medicineKidDetail;
        // print("33 통신 성공");
        return medicineKidDetail;
      }else{
        // print("33 통신 실패");
        return MedicineKidDetail(medicineSeq: 0, kidSeq: 0, symptom: '', pill: "", capacity: '', count: "", time: "", content: "", requestDate: "", requestName: "", responseDate: "", responseName: "",keep: "");
      }
    } catch(e) {
      // print("33 통신 캐치");
      print(e);
      return MedicineKidDetail(medicineSeq: 0, kidSeq: 0, symptom: '', pill: "", capacity: '', count: "", time: "", content: "", requestDate: "", requestName: "", responseDate: "", responseName: "",keep: "");
    }
  }


  // 투약 의뢰서 리스트 (학부모용) - 34
  static Future<List<MedicineKidMonth>> getMedicineKidMonthList(DateTime day) async {
    //request
    //{
    //     "day": "2023-05-09"
    // }

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      String URL =  '${url}medicine/kidList/1';
      final data = {
          "day" : "2023-05-14",
      };

      final response = await http.post(
        Uri.parse(URL),
        headers: postHeaders,
        body:jsonEncode(data)
      );

      if (response.statusCode == 200) {
        final List<MedicineKidMonth> medicineKidMonth = medicineKidMonthModelFromJson(utf8.decode(response.bodyBytes)).medicineKidMonth;
        // print("34 통신 성공");
        return medicineKidMonth;
      }else{
        print(response.statusCode);
        // print("34 통신 실패");
        return<MedicineKidMonth>[];
      }
    }catch(e){
      // print("34 통신 캐치");
      print(e);
      return <MedicineKidMonth>[];
    }
  }


  // 투약 확인 작성 (선생님용)
  static void updateMedicineTime(int medicineSeq, String responseDate) async {
    // request
    // "responseName" : "오선생",
    // "responseDate" :  "2024-05-12 16:00",

    try {
      String URL = '${url}medicine/${medicineSeq}';
      DeviceInfoController c = Get.put(DeviceInfoController());

      final data = {
        "responseName": c.name,
        "responseDate": responseDate,
      };
      final response = await http.put(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)
      );
      if(response.statusCode == 200) {
        // print("일정 등록 성공");
      } else {
        // print('일정 등록 실패!');
      }
    }catch(e) {
      print(e);
    }
  }


  // 투약 의뢰서 작성하기 (부모님용) - 36
  static void updateMedicineInfo(String symptom, String pill, String capacity, String count, String time,
      String keep, String content, String requestName, String requestDate ) async {
    // request
    // "symptom": "몸살 감기",
    // "pill": "알약",
    // "capacity": "3정",
    // "count": "1번"
    // "time": "식후 30분",
    // "store" : "실온보관",
    // "content": "잘먹여주세요",
    // "requestName": "김소정",
    // "requestDate": "2024-05-12",

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      MedicineController mc = Get.put(MedicineController());
      String URL = '${url}medicine/kid/${c.kidSeq}';

      final data = {
       "symptom": symptom,
       "pill": pill,
       "capacity": capacity,
       "count": count,
        "time": time,
        "keep" : "실온",
        "content": content,
       "requestName": requestName,
       "requestDate": requestDate,
      };
      final response = await http.post(
        Uri.parse(URL),
        headers: {"Content-Type" : "application/json"},
        body:jsonEncode(data)
      );
      // print("36 통신 시작");
      if(response.statusCode==200){
        // print("36 통신 성공");
        mc.setMedicineKidMonthList(DateTime.now());
      }else{
        // print("36 통신 실패");
      }
    }catch(e){
      // print("36 통신 캐치");
      print(e);
    }
  }


}