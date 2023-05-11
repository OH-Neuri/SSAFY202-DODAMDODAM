import 'dart:convert';

NoticeListModel noticeListModelFromJson(String str) => NoticeListModel.fromJson(json.decode(str));

class NoticeListModel {
  bool isSuccess;
  int code;
  String message;
  List<NoticeListItem> noticeList;

  NoticeListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.noticeList,
  });

  factory NoticeListModel.fromJson(Map<String, dynamic> json) => NoticeListModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    noticeList: List<NoticeListItem>.from(json["result"].map((x) => NoticeListItem.fromJson(x))),
  );
}

class NoticeListItem {
  int noticeSeq;
  String date;
  String content;
  bool announcement;
  List<String> photo;
  List<String> kid;

  NoticeListItem({
    required this.noticeSeq,
    required this.date,
    required this.content,
    required this.announcement,
    required this.photo,
    required this.kid,
  });

  factory NoticeListItem.fromJson(Map<String, dynamic> json) => NoticeListItem(
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
