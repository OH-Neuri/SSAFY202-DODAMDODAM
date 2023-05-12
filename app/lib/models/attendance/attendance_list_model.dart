// To parse this JSON data, do
//
//     final attendanceListModel = attendanceListModelFromJson(jsonString);

import 'dart:convert';

AttendanceListModel attendanceListModelFromJson(String str) => AttendanceListModel.fromJson(json.decode(str));

class AttendanceListModel {
  bool isSuccess;
  int code;
  String message;
  List<AttendanceListItem> attendanceList;

  AttendanceListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.attendanceList,
  });

  factory AttendanceListModel.fromJson(Map<String, dynamic> json) =>
      AttendanceListModel(
        isSuccess: json["isSuccess"],
        code: json["code"],
        message: json["message"],
        attendanceList: List<AttendanceListItem>.from(
            json["result"].map((x) => AttendanceListItem.fromJson(x))),
      );
}

class AttendanceListItem {
  int kidSeq;
  String name;
  String photo;
  int attendanceSeq;
  String forthTimeCheck;
  dynamic backTimeCheck;

  AttendanceListItem({
    required this.kidSeq,
    required this.name,
    required this.photo,
    required this.attendanceSeq,
    required this.forthTimeCheck,
    this.backTimeCheck,
  });

  factory AttendanceListItem.fromJson(Map<String, dynamic> json) => AttendanceListItem(
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
