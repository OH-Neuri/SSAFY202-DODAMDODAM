import 'dart:convert';

SigledaySchedule sigledayScheduleFromJson(String str) => SigledaySchedule.fromJson(json.decode(str));

String sigledayScheduleToJson(SigledaySchedule data) => json.encode(data.toJson());

class SigledaySchedule {
  bool isSuccess;
  int code;
  String message;
  List<OneSchedule> oneSchedule;

  SigledaySchedule({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.oneSchedule,
  });

  factory SigledaySchedule.fromJson(Map<String, dynamic> json) => SigledaySchedule(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    oneSchedule: List<OneSchedule>.from(json["result"].map((x) => OneSchedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "oneSchedule": List<dynamic>.from(oneSchedule.map((x) => x.toJson())),
  };
}

class OneSchedule {
  int scheduleSeq;
  String type;
  String content;
  dynamic classSeq;

  OneSchedule({
    required this.scheduleSeq,
    required this.type,
    required this.content,
    required this.classSeq,
  });

  factory OneSchedule.fromJson(Map<String, dynamic> json) => OneSchedule(
    scheduleSeq: json["scheduleSeq"],
    type: json["type"],
    content: json["content"],
    classSeq: json["classSeq"],
  );

  Map<String, dynamic> toJson() => {
    "scheduleSeq": scheduleSeq,
    "type": type,
    "content": content,
    "classSeq": classSeq,
  };
}
