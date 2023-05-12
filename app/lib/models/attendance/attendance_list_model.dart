// To parse this JSON data, do
//
//     final attendanceListModel = attendanceListModelFromJson(jsonString);

import 'dart:convert';

AttendanceListModel attendanceListModelFromJson(String str) => AttendanceListModel.fromJson(json.decode(str));

String attendanceListModelToJson(AttendanceListModel data) => json.encode(data.toJson());

class AttendanceListModel {
  bool isSuccess;
  int code;
  String message;
  AttendanceList attendanceList;

  AttendanceListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.attendanceList,
  });

  factory AttendanceListModel.fromJson(Map<String, dynamic> json) => AttendanceListModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    attendanceList: AttendanceList.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "attendanceList": attendanceList.toJson(),
  };
}

class AttendanceList {
  int kidSeq;
  String name;
  String photo;
  int attendanceSeq;
  String forthTimeCheck;
  dynamic backTimeCheck;

  AttendanceList({
    required this.kidSeq,
    required this.name,
    required this.photo,
    required this.attendanceSeq,
    required this.forthTimeCheck,
    this.backTimeCheck,
  });

  factory AttendanceList.fromJson(Map<String, dynamic> json) => AttendanceList(
    kidSeq: json["kidSeq"],
    name: json["name"],
    photo: json["photo"],
    attendanceSeq: json["attendanceSeq"],
    forthTimeCheck: json["forthTimeCheck"],
    backTimeCheck: json["backTimeCheck"],
  );

  Map<String, dynamic> toJson() => {
    "kidSeq": kidSeq,
    "name": name,
    "photo": photo,
    "attendanceSeq": attendanceSeq,
    "forthTimeCheck": forthTimeCheck,
    "backTimeCheck": backTimeCheck,
  };
}
