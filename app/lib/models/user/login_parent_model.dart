import 'dart:convert';

import 'package:app/models/user/login_user_model.dart';

LoginParentModel loginParentModelFromJson(String str) => LoginParentModel.fromJson(json.decode(str));

class LoginParentModel {
  bool isSuccess;
  int code;
  String message;
  LoginParent loginParent;

  LoginParentModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.loginParent,
  });

  factory LoginParentModel.fromJson(Map<String, dynamic> json) => LoginParentModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    loginParent: LoginParent.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "loginParent": loginParent.toJson(),
  };
}

class LoginParent {
  int kidSeq;
  String kidName;
  String kidPhoto;
  int classSeq;
  String className;
  LoginUser loginResponseDto;

  LoginParent({
    required this.kidSeq,
    required this.kidName,
    required this.kidPhoto,
    required this.classSeq,
    required this.className,
    required this.loginResponseDto,
  });

  factory LoginParent.fromJson(Map<String, dynamic> json) => LoginParent(
    kidSeq: json["kidSeq"],
    kidName: json["kidName"],
    kidPhoto: json["kidPhoto"],
    classSeq: json["classSeq"],
    className: json["className"],
    loginResponseDto: LoginUser.fromJson(json["loginResponseDto"]),
  );

  Map<String, dynamic> toJson() => {
    "kidSeq": kidSeq,
    "kidName": kidName,
    "kidPhoto": kidPhoto,
    "classSeq": classSeq,
    "className": className,
    "loginResponseDto": loginResponseDto.toJson(),
  };
}