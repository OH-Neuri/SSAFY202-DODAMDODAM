import 'package:app/models/code/add_class_model.dart';
import 'package:app/models/code/add_kid_model.dart';
import 'package:app/models/user/login_parent_model.dart';
import 'package:app/models/user/login_teacher_model.dart';
import 'package:app/models/user/login_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfoController extends GetxController {
  static DeviceInfoController get to => Get.find();

  SharedPreferences? _prefs;

  // RxBool 변수
  bool isTeacher = false;
  int classSeq = 1;
  int kidSeq = 1;
  bool isLogin = false;
  String token = '';
  String name = '';
  String phone = '';
  String className = '';
  String kidName = '';
  String kidPhoto = '';

  // 컨트롤러 초기화 함수
  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    // SharedPreferences에 저장된 isTeacher 값을 읽어와서 RxBool 변수에 저장
    isTeacher = _prefs!.getBool('isTeacher') ?? true;
    classSeq = _prefs!.getInt('classSeq') ?? 1;
    kidSeq = _prefs!.getInt('kidSeq') ?? 1;
    isLogin = _prefs!.getBool('isLogin') ?? false;
    token = _prefs!.getString('token') ?? '';
    name = _prefs!.getString('name') ?? '';
    phone = _prefs!.getString('phone') ?? '';
    className = _prefs!.getString('className') ?? '';
    kidName = _prefs!.getString('kidName') ?? '';
    kidPhoto = _prefs!.getString('kidPhoto') ?? '';

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

  void setKidSeq(int value) {
    kidSeq = value;
    if (_prefs != null) {
      _prefs!.setInt('kidSeq', value);
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

  void setPhone(String value) {
    phone = value;
    if (_prefs != null) {
      _prefs!.setString('phone', value);
    }
    update();
  }

  void setClassName(String value) {
    className = value;
    if (_prefs != null) {
      _prefs!.setString('className', value);
    }
    update();
  }

  void setKidName(String value) {
    kidName = value;
    if (_prefs != null) {
      _prefs!.setString('kidName', value);
    }
    update();
  }

  void setKidPhoto(String value) {
    kidPhoto = value;
    if (_prefs != null) {
      _prefs!.setString('kidPhoto', value);
    }
    update();
  }

  void loginSetting(LoginUser user) {
    setIsLogin(true);
    if(user.role == 3) {
      setIsTeacher(false);
    }else{
      setIsTeacher(true);
    }
    setToken(user.token);
    setName(user.name);
    setPhone(user.phone);
  }

  void loginSettingForTeacher(LoginTeacher user) {
    setIsLogin(true);
    setIsTeacher(true);
    setClassSeq(user.classSeq);
    setClassName(user.className);
    setToken(user.loginResponseDto.token);
    setName(user.loginResponseDto.name);
    setPhone(user.loginResponseDto.phone);
  }

  void loginSettingForParent(LoginParent user) {
    setIsLogin(true);
    setIsTeacher(false);
    setClassSeq(user.classSeq);
    setClassName(user.className );
    setKidSeq(user.kidSeq);
    setKidName(user.kidName);
    setKidPhoto(user.kidPhoto);
    setToken(user.loginResponseDto.token);
    setName(user.loginResponseDto.name);
    setPhone(user.loginResponseDto.phone);
  }

  void classSetting(AddClass addClass) {
    setClassSeq(addClass.classSeq);
    setClassName(addClass.className);
  }

  void kidSetting(AddKid kid) {
    setClassSeq(kid.classSeq);
    setClassName(kid.className);
    setKidSeq(kid.kidSeq);
    setKidName(kid.kidName);
    setKidPhoto(kid.kidPhoto);
  }

}
