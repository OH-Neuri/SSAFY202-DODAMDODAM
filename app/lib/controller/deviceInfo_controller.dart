import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfoController extends GetxController {
  static DeviceInfoController get to => Get.find();

  SharedPreferences? _prefs;
  bool isTeacher = true;
  int classSeq = 1;

  // 컨트롤러 초기화 함수
  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    isTeacher = _prefs!.getBool('isTeacher') ?? true;
    classSeq = _prefs!.getInt('classSeq') ?? 1;
    update();
  }

  void setIsTeacher(bool value) {
    isTeacher = value;
    if (_prefs != null) {
      _prefs!.setBool('isTeacher', value);
    }
    update();
  }

  void setClassSeq(int value) {
    classSeq = value;
    if(_prefs != null){
      _prefs!.setInt('classSeq', value);
    }
    update();
  }
}