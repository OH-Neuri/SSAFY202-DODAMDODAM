import 'dart:convert';

import 'package:app/models/user/login_user_model.dart';

LoginTeacherModel loginTeacherModelFromJson(String str) => LoginTeacherModel.fromJson(json.decode(str));

class LoginTeacherModel {
  bool isSuccess;
  int code;
  String message;
  LoginTeacher loginTeacher;

  LoginTeacherModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.loginTeacher,
  });

  factory LoginTeacherModel.fromJson(Map<String, dynamic> json) => LoginTeacherModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    loginTeacher: LoginTeacher.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "loginTeacher": loginTeacher.toJson(),
  };
}

class LoginTeacher {
  int classSeq;
  String className;
  LoginUser loginResponseDto;

  LoginTeacher({
    required this.classSeq,
    required this.className,
    required this.loginResponseDto,
  });

  factory LoginTeacher.fromJson(Map<String, dynamic> json) => LoginTeacher(
    classSeq: json["classSeq"],
    className: json["className"],
    loginResponseDto: LoginUser.fromJson(json["loginResponseDto"]),
  );

  Map<String, dynamic> toJson() => {
    "classSeq": classSeq,
    "className": className,
    "loginResponseDto": loginResponseDto.toJson(),
  };
}