import 'dart:convert';
import 'dart:io';
import 'package:app/api/http_header.dart';
import 'package:app/controller/attendance_controller.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/attendance/attendance_detail_model.dart';
import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:intl/intl.dart';




class AttendanceService {
  // 학생 리스트 불러오기 - 18
  static Future<List<AttendanceListItem>> getAttendanceList(DateTime day) async {
    // requset
    //{
    //     "seq" : 3,
    //     "day" : "2023-05-08"
    // }
    // *classSeq 입니다

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      String URL = '${url}class/attendance/list';
      final data = {
        "seq": c.classSeq,
        "day":  DateFormat('yyyy-MM-dd').format(day),
      };
      final response = await http.post(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)
      );
      if(response.statusCode == 200){
        final List<AttendanceListItem> attendanceList = attendanceListModelFromJson(utf8.decode(response.bodyBytes)).attendanceList;
        return attendanceList;
      }else{
        return<AttendanceListItem>[];
      }
    }catch(e){
      // print("학생 리스트 불러오기 - 18 에러 발생");
      print(e);
      return <AttendanceListItem>[];
    }
  }

  // 등하원 정보 가져오기 - 19
  static Future<AttendanceDetail> getAttendanceDetail(int kidSeq, String day) async{
    // request
    //{
    //     "seq" : 3,
    //     "day" : "2023-05-08"
    // }

    try{

      String URL = '${url}class/attendance/info';
      final data = {
        "seq": kidSeq,
        "day": day
      };
      final response = await http.post(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)
      );
        if(response.statusCode==200){
          final AttendanceDetail attendanceDetail = attendanceDetailModelFromJson(utf8.decode(response.bodyBytes)).attendanceDetail;
          return attendanceDetail;
        }else{
          return AttendanceDetail(name: "", photo: "", forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
        }
      }catch(e){
        return AttendanceDetail(name: "", photo: "", forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
        print(e);
      }
  }

  // 등하원 시간 입력(선생님용) - 22

   static Future<void> updateAttendanceTime(int attendanceSeq, String? forthTimeCheck, String? backTimeCheck, int kidSeq) async {
    // request
    //{
    //     "forthTimeCheck" : "08:33:00",
    //     "backTimeCheck" : null
    // }
    try {
     AttendacneController ac = Get.put(AttendacneController());
      String URL = '${url}class/attendance/${ac.attendacneDetail.attendanceSeq}';
      final data = {
        "forthTimeCheck": forthTimeCheck.toString(),
        "backTimeCheck": backTimeCheck.toString(),
        "kidSeq": kidSeq
      };
      final response = await http.put(
          Uri.parse(URL),
          headers: authPostHeaders,
          body: jsonEncode(data)
      );
      if(response.statusCode == 200) {
        ac.setAttendacneDetail(kidSeq, DateFormat('yyyy-MM-dd').format(DateTime.now()));
        ac.setAttendanceList(DateTime.now());
      } else {
      }
    }catch(e) {
      print(e);
    }
  }




  // 등하원 정보 입력하기 - 21
  static Future<void> registAttendance(String forthTime, String backTime, String backWay, String parentName,
      String phoneNumber, String tempParentName, String tempPhoneNumber) async {
    // request
    //{
    //   kidSeq : int,
    //   forthTime : string, (10:30:00)
    //   backTime : string, (17:00:00)
    //   backWay: string,
    //   parentName : string,
    //   phoneNumber : string,
    //   tempParentName : string,
    //   tempPhoneNumber : string,
    // }

    DeviceInfoController c = Get.put(DeviceInfoController());
    try {

      String URL = '${url}class/attendance';
      final data = {
        "kidSeq": c.kidSeq,
        "forthTime": forthTime,
        "backTime": backTime,
        "backWay": backWay,
        "parentName": parentName,
        "phoneNumber": phoneNumber,
        "tempParentName": tempParentName,
        "tempPhoneNumber": tempPhoneNumber,
      };
      final response = await http.post(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)
      );
      if (response.statusCode == 200) {
        // print("21 통신 성공");
        AttendacneController.to.setAttendacneDetail(c.kidSeq,DateFormat('yyyy-MM-dd').format(DateTime.now()));
        AttendacneController.to.setAttendanceList(DateTime.now());
      }else{
        // print("21 통신 실패");
      }
    } catch (e) {
      // print("21 통신 실패 캐치 잡힘");
      print(e);
    }
  }




}