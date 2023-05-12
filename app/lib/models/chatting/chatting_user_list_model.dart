import 'dart:convert';

ChattingUserList chattingUserListFromJson(String str) => ChattingUserList.fromJson(json.decode(str));

String chattingUserListToJson(ChattingUserList data) => json.encode(data.toJson());

class ChattingUserList {
  bool isSuccess;
  int code;
  String message;
  List<SingleUser> userList;

  ChattingUserList({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.userList,
  });

  factory ChattingUserList.fromJson(Map<String, dynamic> json) => ChattingUserList(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    userList: List<SingleUser>.from(json["result"].map((x) => SingleUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "userList": List<dynamic>.from(userList.map((x) => x.toJson())),
  };
}

class SingleUser {
  String kidName;
  String kidPhoto;
  int? parentSeq;
  String? parentName;

  SingleUser({
    required this.kidName,
    required this.kidPhoto,
    this.parentSeq,
    this.parentName,
  });

  factory SingleUser.fromJson(Map<String, dynamic> json) => SingleUser(
    kidName: json["kidName"],
    kidPhoto: json["kidPhoto"],
    parentSeq: json["parentSeq"],
    parentName: json["parentName"],
  );

  Map<String, dynamic> toJson() => {
    "kidName": kidName,
    "kidPhoto": kidPhoto,
    "parentSeq": parentSeq,
    "parentName": parentName,
  };
}
