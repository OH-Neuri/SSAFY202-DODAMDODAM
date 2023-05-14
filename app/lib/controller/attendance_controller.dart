import 'package:app/api/attendance_service.dart';
import 'package:app/models/attendance/attendance_detail_model.dart';
import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:get/get.dart';

class AttendacneController extends GetxController {
  static AttendacneController get to => Get.find();

  List<AttendanceListItem> attendaceList = <AttendanceListItem>[];
  AttendanceDetail attendacneDetail = AttendanceDetail(name: "", photo: "", date: DateTime.now(), forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");

  @override
  void onInit() async{
    // 원생 리스트 가져오기
    setAttendanceList(DateTime.now());
    setAttendacneDetail(1, DateTime.now());
    super.onInit();
    update();
  }

  // 해당 날짜 등하원 리스트 가져오기
  void setAttendanceList(DateTime day) async {
   try{
     attendaceList = await AttendacneService.getAttendanceList(day);
   }catch(e){
     print(e);
   }
   update();
  }

  // 해당 날짜의 원생 등하원 내용 가져오기
  void setAttendacneDetail(int kidSeq, DateTime day) async{
    try{
      attendacneDetail = await AttendacneService.getAttendanceInput(kidSeq, day);
    }catch(e){
      print(e);
    }
    update();
  }
}