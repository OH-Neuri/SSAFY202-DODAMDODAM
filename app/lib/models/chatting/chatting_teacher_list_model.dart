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
  int teacherSeq;
  String teacherName;

  SingleTeacher({
    required this.teacherSeq,
    required this.teacherName,
  });

  factory SingleTeacher.fromJson(Map<String, dynamic> json) => SingleTeacher(
    teacherSeq: json["teacherSeq"],
    teacherName: json["teacherName"],
  );

  Map<String, dynamic> toJson() => {
    "teacherSeq": teacherSeq,
    "teacherName": teacherName,
  };
}
