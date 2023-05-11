import 'dart:convert';

ScheduleTypeModel scheduleTypeModelFromJson(String str) => ScheduleTypeModel.fromJson(json.decode(str));

String scheduleTypeModelToJson(ScheduleTypeModel data) => json.encode(data.toJson());

class ScheduleTypeModel {
  bool isSuccess;
  int code;
  String message;
  List<SingleType> typeList;

  ScheduleTypeModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.typeList,
  });

  factory ScheduleTypeModel.fromJson(Map<String, dynamic> json) => ScheduleTypeModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    typeList: List<SingleType>.from(json["result"].map((x) => SingleType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "typeList": List<dynamic>.from(typeList.map((x) => x.toJson())),
  };
}

class SingleType {
  int scheduleTypeSeq;
  String content;

  SingleType({
    required this.scheduleTypeSeq,
    required this.content,
  });

  factory SingleType.fromJson(Map<String, dynamic> json) => SingleType(
    scheduleTypeSeq: json["scheduleTypeSeq"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "scheduleTypeSeq": scheduleTypeSeq,
    "content": content,
  };
}
