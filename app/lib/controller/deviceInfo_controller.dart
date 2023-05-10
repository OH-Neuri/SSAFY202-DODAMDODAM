import 'package:app/models/user/login_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfoController extends GetxController {
  static DeviceInfoController get to => Get.find();

  // SharedPreferences 인스턴스 변수
  SharedPreferences? _prefs;

  // RxBool 변수
  RxBool isTeacher = false.obs;
  RxInt classSeq = 1.obs;
  RxBool isLogin = false.obs;
  RxString token = ''.obs;
  RxString name = ''.obs;

  // 컨트롤러 초기화 함수
  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  // SharedPreferences에서 데이터 불러오기
  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    // SharedPreferences에 저장된 isTeacher 값을 읽어와서 RxBool 변수에 저장
    isTeacher.value = _prefs!.getBool('isTeacher') ?? false;
    classSeq.value = _prefs!.getInt('classSeq') ?? 0;
    isLogin.value = _prefs!.getBool('isLogin') ?? false;
    token.value = _prefs!.getString('token') ?? '';
    name.value = _prefs!.getString('name') ?? '';
  }

  void setIsTeacher(bool value) {
    isTeacher.value = value;
    _prefs!.setBool('isTeacher', value);
  }

  void setClassSeq(int value) {
    classSeq.value = value;
    _prefs!.setInt('classSeq', value);
  }

  void setIsLogin(bool value) {
    isLogin.value = value;
    _prefs!.setBool('isLogin', value);
  }
  
  void setToken(String value) {
    token.value = value;
    _prefs!.setString('token', value);
  }

  void setName(String value) {
    name.value = value;
    _prefs!.setString('name', value);
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
  }
}