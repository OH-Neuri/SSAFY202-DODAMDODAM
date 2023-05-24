import 'package:app/api/attendance_service.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/attendance/attendance_detail_model.dart';
import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendacneController extends GetxController {
  static AttendacneController get to => Get.find();

  DeviceInfoController c = Get.put(DeviceInfoController());
  List<AttendanceListItem> attendaceList = <AttendanceListItem>[];
  AttendanceDetail attendacneDetail = AttendanceDetail(name: "", tempPhoneNumber:"",tempParentName: "",backTimeCheck: "",photo: "", forthTime: "", backTime: "", forthTimeCheck: "", parentName: "", phoneNumber: "");
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override

  void onInit() async{
    setAttendanceList(DateTime.now());
    if(!c.isTeacher) setAttendacneDetail(c.kidSeq,DateFormat('yyyy-MM-dd').format(DateTime.now()));
    super.onInit();
    update();
  }

  // 해당 날짜 등하원 리스트 가져오기
  void setAttendanceList(DateTime day) async {
    try{
      attendaceList = await AttendanceService.getAttendanceList(day);
    }catch(e){
      print(e);
    }
    update();
  }

  // 해당 날짜의 원생 등하원 내용 가져오기
  Future<bool> setAttendacneDetail(int kidSeq, String day) async{
    try{
      attendacneDetail = await AttendanceService.getAttendanceDetail(kidSeq, day);
      update();
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

}