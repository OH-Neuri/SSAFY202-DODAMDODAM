import 'dart:convert';

AddClassModel addClassModelFromJson(String str) => AddClassModel.fromJson(json.decode(str));

String addClassModelToJson(AddClassModel data) => json.encode(data.toJson());

class AddClassModel {
  bool isSuccess;
  int code;
  String message;
  AddClass addClass;

  AddClassModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.addClass,
  });

  factory AddClassModel.fromJson(Map<String, dynamic> json) => AddClassModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    addClass: AddClass.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "addClass": addClass.toJson(),
  };
}

class AddClass {
  int classSeq;
  String className;

  AddClass({
    required this.classSeq,
    required this.className,
  });

  factory AddClass.fromJson(Map<String, dynamic> json) => AddClass(
    classSeq: json["classSeq"],
    className: json["className"],
  );

  Map<String, dynamic> toJson() => {
    "classSeq": classSeq,
    "className": className,
  };
}