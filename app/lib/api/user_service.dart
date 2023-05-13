import 'dart:convert';

import 'package:app/api/http_header.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/controller/deviceInfo_controller.dart';
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
      print(jsonEncode(data));
      String URL = '${url}user/login';
      final res = await http.post(
          Uri.parse(URL),
          headers: postHeaders,
          body: jsonEncode(data));
      if(res.statusCode == 200) {
        if(role == 3) {
          try{
            final LoginParent loginParent = loginParentModelFromJson(utf8.decode(res.bodyBytes)).loginParent;
            result.result = true;
            if(loginParent.classSeq == 0){
              c.loginSetting(loginParent.loginResponseDto);
            }else{
              print(loginParent.classSeq);
              c.loginSettingForParent(loginParent);
              result.code = true;
            }
          }catch (e) {
            print(e);
          }
        }else{
          try {
            final LoginTeacher loginTeacher = loginTeacherModelFromJson(utf8.decode(res.bodyBytes)).loginTeacher;
            result.result = true;
            if(loginTeacher.classSeq == 0){
              c.loginSetting(loginTeacher.loginResponseDto);
              result.code = false;
            }else{
              c.loginSettingForTeacher(loginTeacher);
              result.code = true;
            }
          }catch (e) {
            print(e);
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
}