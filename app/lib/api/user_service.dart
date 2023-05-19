import 'dart:convert';

import 'package:app/api/http_header.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/user/id_duplication_check_model.dart';
import 'package:app/models/user/login_parent_model.dart';
import 'package:app/models/user/login_result.dart';
import 'package:app/models/user/login_teacher_model.dart';
import 'package:app/models/user/login_user_model.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<LoginResult> userLogin(String id, String pw, int role) async {
    LoginResult result = LoginResult(result: false, code: false);
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      Map<String, dynamic> data = {
        'id' : id,
        'password' : pw,
        'role' : role,
      };
      String URL = '${url}user/login';
      final res = await http.post(
          Uri.parse(URL),
          headers: postHeaders,
          body: jsonEncode(data));
      if(res.statusCode == 200) {
        result.result = true;
        if(role == 3) {
          final LoginParent loginParent = loginParentModelFromJson(utf8.decode(res.bodyBytes)).loginParent;
          if(loginParent.classSeq == null){
            c.loginSetting(loginParent.loginResponseDto);
            result.code = false;
          }else{
            c.loginSettingForParent(loginParent);
            result.code = true;
          }
        }else{
          final LoginTeacher loginTeacher = loginTeacherModelFromJson(utf8.decode(res.bodyBytes)).loginTeacher;
          if(loginTeacher.classSeq == null){
            c.loginSetting(loginTeacher.loginResponseDto);
            result.code = false;
          }else{
            c.loginSettingForTeacher(loginTeacher);
            result.code = true;
          }
        }
        return result;
      }else{
        print(res.statusCode);
        return result;
      }
    } catch(e) {
      print(e);
      return result;
    }
  }

  static Future<void> sendAuthPhone(String phone, int role) async {
    try {
      Map<String, dynamic> data = {
        'phone' : phone,
        'role' : role,
      };
      print(jsonEncode(data));
      String URL = '${url}sms/user';
      final res = await http.post(
          Uri.parse(URL),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(data)
      );
      if(res.statusCode == 200){
        print('전송 성공');
      }
      print(res.statusCode);
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> authPhoneCheck(String phone, String code) async {
    try {
      Map<String, String> data = {
        'phone' : phone,
        'code' : code,
      };
      String URL = '${url}sms/user/check';
      final res = await http.post(
          Uri.parse(URL),
          headers: {'Content-Type' : 'application/json'},
          body: jsonEncode(data));
      if(res.statusCode == 200) {
        print('인증코드 통과');
        return true;
      }
      print('인증코드 실패');
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> userSignup(SignupUserModel user) async {
    DeviceInfoController c = Get.put(DeviceInfoController());
    try {
      String data = signupUserModelToJson(user);
      print(data);
      String URL = '${url}user';
      final res = await http.post(
        Uri.parse(URL),
        headers: {"Content-Type" : "application/json"},
        body: data
      );
      if (res.statusCode == 200){
        final LoginUser loginUser = loginUserModelFromJson(utf8.decode(res.bodyBytes)).loginUser;
        c.loginSetting(loginUser);
        return true;
      }else{
        print('회원가입 실패');
        print(res.statusCode);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // id 중복 체크
  static Future<bool> idDuplicationCheck(String id) async {
    try {
      String URL = '${url}user/check/$id';
      final res = await http.get(Uri.parse(URL));
      if(res.statusCode == 200) {
        bool result = idDuplicationCheckModelFromJson(utf8.decode(res.bodyBytes)).result;
        return !result;
      }else{
        print(res.statusCode);
        return false;
      }
    } catch(e) {
      print(e);
      return false;
    }
  }
}