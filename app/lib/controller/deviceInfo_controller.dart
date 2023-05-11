import 'package:app/models/user/login_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfoController extends GetxController {
  static DeviceInfoController get to => Get.find();

  SharedPreferences? _prefs;

  // RxBool 변수
  bool isTeacher = false;
  int classSeq = 1;
  bool isLogin = false;
  String token = '';
  String name = '';

  // 컨트롤러 초기화 함수
  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    // SharedPreferences에 저장된 isTeacher 값을 읽어와서 RxBool 변수에 저장
    isTeacher = _prefs!.getBool('isTeacher') ?? false;
    classSeq = _prefs!.getInt('classSeq') ?? 0;
    isLogin = _prefs!.getBool('isLogin') ?? false;
    token = _prefs!.getString('token') ?? '';
    name = _prefs!.getString('name') ?? '';
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
    if (_prefs != null) {
      _prefs!.setInt('classSeq', value);
    }
    update();
  }

  void setIsLogin(bool value) {
    isLogin = value;
    if (_prefs != null) {
      _prefs!.setBool('isLogin', value);
    }
    update();
  }

  void setToken(String value) {
    token = value;
    if (_prefs != null) {
      _prefs!.setString('token', value);
    }
    update();
  }

  void setName(String value) {
    name = value;
    if (_prefs != null) {
      _prefs!.setString('name', value);
    }
    update();
  }

  void loginSetting(LoginUser user) {
    setIsLogin(true);
    if (user.role == 3) {
      setIsTeacher(false);
    } else {
      setIsTeacher(true);
    }
    setToken(user.token);
    setName(user.name);
  }
}
