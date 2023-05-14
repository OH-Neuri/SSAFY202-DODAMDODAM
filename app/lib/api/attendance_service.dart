import 'dart:convert';
import 'dart:io';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/attendance/attendance_detail_model.dart';
import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';
import 'package:intl/intl.dart';
class AttendacneService {

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
      print("학생 리스트 불러오기 - 18 에러 발생");
      print(e);
      return <AttendanceListItem>[];
    }
  }

  // 등하원 해당 날에 작성된 정보 조회하기 - 19
  static Future<AttendanceDetail> getAttendanceDetail(int attendanceSeq) async {

    try{
      String URL = '${url}class/attendance/$attendanceSeq';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode==200){
        final AttendanceDetail attendanceDetail = attendanceDetailModelFromJson(utf8.decode(res.bodyBytes)).attendanceDetail;
        return attendanceDetail;
      }else{
        return AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
      }
    }catch(e){
      print(e);
      return AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
    }
  }

  // 등하원 정보 가져오기(작성용) - 20
  static Future<AttendanceDetail> getAttendanceInput(int kidSeq, DateTime day) async{
    // request
    //{
    //     "seq" : 3,
    //     "day" : "2023-05-08"
    // }

    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
        String URL ='${url}class/attendance/form';
        final data = {
          "seq": kidSeq,
          "day": DateFormat('yyyy-MM-dd').format(day),
        };
        final res = await http.post(
            Uri.parse(URL),
            headers: {"Content-Type" : "application/json"},
            body: jsonEncode(data)
        );
        print("통신 시작");
        if(res.statusCode==200){
          final AttendanceDetail attendanceDetail = attendanceDetailModelFromJson(utf8.decode(res.bodyBytes)).attendanceDetail;
          print("통신 성공");
          return attendanceDetail;
        }else{
          print("여기까지옴3");
          return AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
        }
      }catch(e){
        print("통신 실패");
        return AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
        print(e);
      }
  }

  // 등하원 시간 입력(선생님용) - 22

  static void updateAttendanceTime(int attendanceSeq, String? forthTimeCheck, String? backTimeCheck) async {
    // request
    //{
    //     "forthTimeCheck" : "08:33:00",
    //     "backTimeCheck" : null
    // }
    try {
      String URL = '${url}class/attendance/$attendanceSeq';
      final data = {
        "forthTimeCheck": forthTimeCheck,
        "backTimeCheck": backTimeCheck,
      };
      final response = await http.put(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)
      );
      if(response.statusCode == 200) {
        print("원생 등하원 시간 등록 성공!");
      } else {
        print('일정 등록 실패!');
      }
    }catch(e) {
      print(e);
    }
  }

}