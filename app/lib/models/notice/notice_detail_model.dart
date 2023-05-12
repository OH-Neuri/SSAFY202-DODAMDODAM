import 'dart:convert';

NoticeDetailModel noticeDetailModelFromJson(String str) => NoticeDetailModel.fromJson(json.decode(str));

String noticeDetailModelToJson(NoticeDetailModel data) => json.encode(data.toJson());

class NoticeDetailModel {
  bool isSuccess;
  int code;
  String message;
  NoticeDetail noticeDetail;

  NoticeDetailModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.noticeDetail,
  });

  factory NoticeDetailModel.fromJson(Map<String, dynamic> json) => NoticeDetailModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    noticeDetail: NoticeDetail.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "noticeDetail": noticeDetail.toJson(),
  };
}

class NoticeDetail {
  int noticeSeq;
  String date;
  String content;
  bool announcement;
  List<String> photo;
  List<String> kid;

  NoticeDetail({
    required this.noticeSeq,
    required this.date,
    required this.content,
    required this.announcement,
    required this.photo,
    required this.kid,
  });

  factory NoticeDetail.fromJson(Map<String, dynamic> json) => NoticeDetail(
    noticeSeq: json["noticeSeq"],
    date: json["date"],
    content: json["content"],
    announcement: json["announcement"],
    photo: List<String>.from(json["photo"].map((x) => x)),
    kid: List<String>.from(json["kid"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "noticeSeq": noticeSeq,
    "date": date,
    "content": content,
    "announcement": announcement,
    "photo": List<dynamic>.from(photo.map((x) => x)),
    "kid": List<dynamic>.from(kid.map((x) => x)),
  };
}