import 'dart:convert';

AddKidModel addKidModelFromJson(String str) => AddKidModel.fromJson(json.decode(str));

String addKidModelToJson(AddKidModel data) => json.encode(data.toJson());

class AddKidModel {
  bool isSuccess;
  int code;
  String message;
  AddKid addKid;

  AddKidModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.addKid,
  });

  factory AddKidModel.fromJson(Map<String, dynamic> json) => AddKidModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    addKid: AddKid.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "addKid": addKid.toJson(),
  };
}

class AddKid {
  int kidSeq;
  String kidName;
  String kidPhoto;
  int classSeq;
  String className;

  AddKid({
    required this.kidSeq,
    required this.kidName,
    required this.kidPhoto,
    required this.classSeq,
    required this.className,
  });

  factory AddKid.fromJson(Map<String, dynamic> json) => AddKid(
    kidSeq: json["kidSeq"],
    kidName: json["kidName"],
    kidPhoto: json["kidPhoto"],
    classSeq: json["classSeq"],
    className: json["className"],
  );

  Map<String, dynamic> toJson() => {
    "kidSeq": kidSeq,
    "kidName": kidName,
    "kidPhoto": kidPhoto,
    "classSeq": classSeq,
    "className": className,
  };
}