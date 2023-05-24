import 'dart:convert';

import 'package:app/models/code/add_class_model.dart';

ClassListModel classListModelFromJson(String str) => ClassListModel.fromJson(json.decode(str));

String classListModelToJson(ClassListModel data) => json.encode(data.toJson());

class ClassListModel {
  bool isSuccess;
  int code;
  String message;
  List<AddClass> classList;

  ClassListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.classList,
  });

  factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    classList: List<AddClass>.from(json["result"].map((x) => AddClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "classList": List<dynamic>.from(classList.map((x) => x.toJson())),
  };
}