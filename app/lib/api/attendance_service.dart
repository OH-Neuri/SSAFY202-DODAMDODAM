import 'dart:convert';
import 'dart:io';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/attendance/attendance_detail_model.dart';
import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';

class AttendacneService {

  // 학생 리스트 불러오기 - 18
  static Future<List<AttendanceListItem>> getAttendanceList(String day) async {
    try{
      DeviceInfoController c = Get.put(DeviceInfoController());
      // 잠시 테스트
      c.setClassSeq(1);
      String URL = '${url}class/attendance/list';

      final data = {
        "seq": c.classSeq,
        "day": day
      };

      final response = await http.get(
        Uri.parse(URL),
          // body: jsonEncode(data)
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

  // 등하원 정보 가져오기(학부모 작성용) - 20
  static Future<AttendanceDetail> getAttendanceInput(DateTime day) async{
    DeviceInfoController c = Get.put(DeviceInfoController());
    try{
        int kidSeq = c.kidSeq;
        String URL = '${url}class/attendance/form';
        final res = await http.get(Uri.parse(URL));
        if(res.statusCode==200){
          final AttendanceDetail attendanceDetail = attendanceDetailModelFromJson(utf8.decode(res.bodyBytes)).attendanceDetail;
          return attendanceDetail;
        }else{
          return AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
        }
      }catch(e){
        return AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
        print(e);
      }
  }

  // 등하원 시간 입력(선생님용) - 22
  static void updateAttendanceTime(int attendanceSeq, String? forthTimeCheck, String? backTimeCheck) async {
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