import 'dart:convert';
import 'package:app/controller/today_controller.dart';
import 'package:app/models/medicine/medicine_class_list_model.dart';
import 'package:app/models/medicine/medicine_kid_detail_model.dart';
import 'package:app/models/medicine/medicine_kid_month_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';

class MedicineService {

  // 반별 투약 확인서 리스트 가져오기 (선생님용) - 32 ---------- 수정 필요
  static Future<List<MedicineClassList>> getMedicineClassList() async {
    // request
    //{
    //     "day": "2023-05-09"
    // }

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      int classSeq = c.classSeq;
      String URL = '${url}medicine/class/${c.classSeq}';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode == 200){
        final List<MedicineClassList> medicineClassList = medicineClassListModelFromJson(utf8.decode(res.bodyBytes)).medicineClassList;
        return medicineClassList;
      }else {
        print('$URL 오늘의 일정 에러 발생');
        return <MedicineClassList>[];
      }
    }catch(e){
      print(e);
      return <MedicineClassList>[];
    }
  }


  // 투약 확인서 상세 페이지 (선생님&학부모) - 33
  static Future<MedicineKidDetail> getMedicineDetail() async {

    try {
      String URL = '${url}medicine/{medicineSeq}';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode == 200){
        final MedicineKidDetail noticeDetail = medicineKidDetailModelFromJson(utf8.decode(res.bodyBytes)).medicineKidDetail;
        return noticeDetail;
      }else{
        return MedicineKidDetail(medicineSeq: 0, kidSeq: 0, symptom: '', pill: "", capacity: '', count: "", time: "", content: "", requestDate: "", requestName: "", responseDate: "", responseName: "");
      }
    } catch(e) {
      print(e);
      return MedicineKidDetail(medicineSeq: 0, kidSeq: 0, symptom: '', pill: "", capacity: '', count: "", time: "", content: "", requestDate: "", requestName: "", responseDate: "", responseName: "");
    }
  }


  // 투약 의뢰서 리스트 (학부모용) - 34  -------------- 수정 필요
  static Future<List<MedicineKidMonth>> getMedicineKidMonthList() async {
    //request
    //{
    //     "day": "2023-05-09"
    // }

    DeviceInfoController c = Get.put(DeviceInfoController());
    try{
      int kidSeq = 3; // 임시
      String URL =  '${url}medicine/kid/${c.kidSeq}';
      final res = await http.get(Uri.parse(URL));
      if (res.statusCode == 200) {
        final List<MedicineKidMonth> noticeList = medicineKidMonthModelFromJson(utf8.decode(res.bodyBytes)).medicineKidMonth;
        return noticeList;
      }else{
        return<MedicineKidMonth>[];
      }
    }catch(e){
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
        print("일정 등록 성공");
      } else {
        print('일정 등록 실패!');
      }
    }catch(e) {
      print(e);
    }
  }


  // 투약 의뢰서 작성하기 (부모님용) - 36
  static void updateMedicineInfo(String symptom, String pill, String capacity, String count, String time,
      String store, String content, String requsetName, String requestDate ) async {
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
    // "requestSign": "김소정사인.png"

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      String URL = '${url}medicine/kid/${c.kidSeq}';

      final data = {
      "symptom": symptom,
      "pill": pill,
      "capacity": capacity,
      "count": count,
      "time": time,
      "store" : store,
      "content": content,
      "requestName": requsetName,
      "requestDate": requestDate,
      };
      final response = await http.post(
        Uri.parse(URL),
        headers: {"Content-Type" : "application/json"},
        body:jsonEncode(data)
      );
      if(response.statusCode==200){
        print("투약 의뢰서 작성하기 완료!");
      }else{
        print("투약 의뢰서 작성하기 실패!");
      }
    }catch(e){
      print(e);
    }
  }


}