import 'dart:convert';

ChattingTeacherList chattingTeacherListFromJson(String str) => ChattingTeacherList.fromJson(json.decode(str));
String chattingTeacherListToJson(ChattingTeacherList data) => json.encode(data.toJson());

class ChattingTeacherList {
  bool isSuccess;
  int code;
  String message;
  List<SingleTeacher> teacherList;

  ChattingTeacherList({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.teacherList,
  });

  factory ChattingTeacherList.fromJson(Map<String, dynamic> json) => ChattingTeacherList(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    teacherList: List<SingleTeacher>.from(json["result"].map((x) => SingleTeacher.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "teacherList": List<dynamic>.from(teacherList.map((x) => x.toJson())),
  };
}

class SingleTeacher {
  int classTeacherSeq;
  String teacherName;
  dynamic sleepModeStart;
  dynamic sleepModeEnd;

  SingleTeacher({
    required this.classTeacherSeq,
    required this.teacherName,
    this.sleepModeEnd,
    this.sleepModeStart
  });

  factory SingleTeacher.fromJson(Map<String, dynamic> json) => SingleTeacher(
      classTeacherSeq: json["classTeacherSeq"],
      teacherName: json["teacherName"],
      sleepModeStart: json["sleepModeStart"],
      sleepModeEnd: json["sleepModeEnd"]
  );

  Map<String, dynamic> toJson() => {
    "teacherSeq": classTeacherSeq,
    "teacherName": teacherName,
    "sleepModeStart": sleepModeStart,
    "sleepModeEnd" : sleepModeEnd
  };
}
