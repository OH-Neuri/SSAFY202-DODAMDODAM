import 'dart:convert';

ClassKidListModel classKidListModelFromJson(String str) => ClassKidListModel.fromJson(json.decode(str));

class ClassKidListModel {
  bool isSuccess;
  int code;
  String message;
  List<ClassKid> classKid;

  ClassKidListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.classKid,
  });

  factory ClassKidListModel.fromJson(Map<String, dynamic> json) => ClassKidListModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    classKid: List<ClassKid>.from(json["result"].map((x) => ClassKid.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "classKid": List<dynamic>.from(classKid.map((x) => x.toJson())),
  };
}

class ClassKid {
  int kidSeq;
  String name;
  String photo;

  ClassKid({
    required this.kidSeq,
    required this.name,
    required this.photo,
  });

  factory ClassKid.fromJson(Map<String, dynamic> json) => ClassKid(
    kidSeq: json["kidSeq"],
    name: json["name"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "kidSeq": kidSeq,
    "name": name,
    "photo": photo,
  };
}
