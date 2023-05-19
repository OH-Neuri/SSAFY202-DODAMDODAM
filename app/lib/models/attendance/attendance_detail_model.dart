// To parse this JSON data, do
//
//     final attendanceDetailModel = attendanceDetailModelFromJson(jsonString);

import 'dart:convert';

AttendanceDetailModel attendanceDetailModelFromJson(String str) => AttendanceDetailModel.fromJson(json.decode(str));

String attendanceDetailModelToJson(AttendanceDetailModel data) => json.encode(data.toJson());

class AttendanceDetailModel {
  bool isSuccess;
  int code;
  String message;
  AttendanceDetail attendanceDetail;

  AttendanceDetailModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.attendanceDetail,
  });

  factory AttendanceDetailModel.fromJson(Map<String, dynamic> json) => AttendanceDetailModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    attendanceDetail: AttendanceDetail.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "attendanceDetail": attendanceDetail.toJson(),
  };
}

class AttendanceDetail {
  String name;
  String photo;
  dynamic attendanceSeq;
  dynamic forthTime;
  dynamic backTime;
  dynamic forthTimeCheck;
  dynamic backTimeCheck;
  dynamic parentName;
  dynamic backWay;
  dynamic phoneNumber;
  dynamic tempParentName;
  dynamic tempPhoneNumber;

  AttendanceDetail({
    required this.name,
    required this.photo,
    this.attendanceSeq,
    this.forthTime,
    this.backTime,
    this.backWay,
    this.forthTimeCheck,
    this.backTimeCheck,
    this.parentName,
    this.phoneNumber,
    this.tempParentName,
    this.tempPhoneNumber,
  });

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) => AttendanceDetail(
    name: json["name"],
    photo: json["photo"],
    attendanceSeq: json["attendanceSeq"],
    forthTime: json["forthTime"],
    backTime: json["backTime"],
    backWay: json["backWay"],
    forthTimeCheck: json["forthTimeCheck"],
    backTimeCheck: json["backTimeCheck"],
    parentName: json["parentName"],
    phoneNumber: json["phoneNumber"],
    tempParentName: json["tempParentName"],
    tempPhoneNumber: json["tempPhoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photo": photo,
    "attendanceSeq": attendanceSeq,
    "forthTime": forthTime,
    "backTime": backTime,
    "backWay":backWay,
    "forthTimeCheck": forthTimeCheck,
    "backTimeCheck": backTimeCheck,
    "parentName": parentName,
    "phoneNumber": phoneNumber,
    "tempParentName": tempParentName,
    "tempPhoneNumber": tempPhoneNumber,
  };
}
