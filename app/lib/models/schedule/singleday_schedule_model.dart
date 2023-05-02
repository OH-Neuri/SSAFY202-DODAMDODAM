import 'dart:convert';

SigledaySchedule sigledayScheduleFromJson(String str) => SigledaySchedule.fromJson(json.decode(str));
String sigledayScheduleToJson(SigledaySchedule data) => json.encode(data.toJson());


class SigledaySchedule {
  bool isSuccess;
  int code;
  String message;
  List<OneSchedule> scheduleList;

  SigledaySchedule({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.scheduleList,
  });

  factory SigledaySchedule.fromJson(Map<String, dynamic> json) => SigledaySchedule(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    scheduleList: List<OneSchedule>.from(json["result"].map((x) => OneSchedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "result": List<dynamic>.from(scheduleList.map((x) => x.toJson())),
  };
}

class OneSchedule {
  int scheduleSeq;
  String type;
  String content;

  OneSchedule({
    required this.scheduleSeq,
    required this.type,
    required this.content,
  });

  factory OneSchedule.fromJson(Map<String, dynamic> json) => OneSchedule(
    scheduleSeq: json["scheduleSeq"],
    type: json["type"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "scheduleSeq": scheduleSeq,
    "type": type,
    "content": content,
  };
}
