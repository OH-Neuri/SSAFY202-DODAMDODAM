import 'dart:convert';

NoticeRegistResponseModel noticeRegistResponseModelFromJson(String str) => NoticeRegistResponseModel.fromJson(json.decode(str));

String noticeRegistResponseModelToJson(NoticeRegistResponseModel data) => json.encode(data.toJson());

class NoticeRegistResponseModel {
  bool isSuccess;
  int code;
  String message;
  List<NotifyModel> notifyModel;

  NoticeRegistResponseModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.notifyModel,
  });

  factory NoticeRegistResponseModel.fromJson(Map<String, dynamic> json) => NoticeRegistResponseModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    notifyModel: List<NotifyModel>.from(json["result"].map((x) => NotifyModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "notifyModel": List<dynamic>.from(notifyModel.map((x) => x.toJson())),
  };
}

class NotifyModel {
  String content;
  int type;
  int typeSeq;
  int sendUserSeq;
  int receiveUserSeq;

  NotifyModel({
    required this.content,
    required this.type,
    required this.typeSeq,
    required this.sendUserSeq,
    required this.receiveUserSeq,
  });

  factory NotifyModel.fromJson(Map<String, dynamic> json) => NotifyModel(
    content: json["content"],
    type: json["type"],
    typeSeq: json["typeSeq"],
    sendUserSeq: json["sendUserSeq"],
    receiveUserSeq: json["receiveUserSeq"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "type": type,
    "typeSeq": typeSeq,
    "sendUserSeq": sendUserSeq,
    "receiveUserSeq": receiveUserSeq,
  };
}