import 'dart:convert';

SleepModeTimeModel sleepModeTimeModelFromJson(String str) => SleepModeTimeModel.fromJson(json.decode(str));

String sleepModeTimeModelToJson(SleepModeTimeModel data) => json.encode(data.toJson());

class SleepModeTimeModel {
  bool isSuccess;
  int code;
  String message;
  SleepModeTime sleepModeTime;

  SleepModeTimeModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.sleepModeTime,
  });

  factory SleepModeTimeModel.fromJson(Map<String, dynamic> json) => SleepModeTimeModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    sleepModeTime: SleepModeTime.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "sleepModeTime": sleepModeTime.toJson(),
  };
}

class SleepModeTime {
  dynamic sleepModeStart;
  dynamic sleepModeEnd;

  SleepModeTime({
    required this.sleepModeStart,
    required this.sleepModeEnd,
  });

  factory SleepModeTime.fromJson(Map<String, dynamic> json) => SleepModeTime(
    sleepModeStart: json["sleepModeStart"],
    sleepModeEnd: json["sleepModeEnd"],
  );

  Map<String, dynamic> toJson() => {
    "sleepModeStart": sleepModeStart,
    "sleepModeEnd": sleepModeEnd,
  };
}