// To parse this JSON data, do
//
//     final notifyReceive = notifyReceiveFromJson(jsonString);

import 'dart:convert';

NotifyReceive notifyReceiveFromJson(String str) => NotifyReceive.fromJson(json.decode(str));

String notifyReceiveToJson(NotifyReceive data) => json.encode(data.toJson());

class NotifyReceive {
  String notifySeq;
  String content;
  int type;
  int typeSeq;
  int sendUserSeq;
  int receiveUserSeq;
  bool readState;
  DateTime createdAt;

  NotifyReceive({
    required this.notifySeq,
    required this.content,
    required this.type,
    required this.typeSeq,
    required this.sendUserSeq,
    required this.receiveUserSeq,
    required this.readState,
    required this.createdAt,
  });

  factory NotifyReceive.fromJson(Map<String, dynamic> json) => NotifyReceive(
    notifySeq: json["notifySeq"],
    content: json["content"],
    type: json["type"],
    typeSeq: json["typeSeq"],
    sendUserSeq: json["sendUserSeq"],
    receiveUserSeq: json["receiveUserSeq"],
    readState: json["readState"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "notifySeq": notifySeq,
    "content": content,
    "type": type,
    "typeSeq": typeSeq,
    "sendUserSeq": sendUserSeq,
    "receiveUserSeq": receiveUserSeq,
    "readState": readState,
    "createdAt": createdAt.toIso8601String(),
  };
}
