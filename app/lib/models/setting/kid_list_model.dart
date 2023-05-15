import 'dart:convert';

import 'package:app/models/code/add_kid_model.dart';

KidListModel kidListModelFromJson(String str) => KidListModel.fromJson(json.decode(str));

String kidListModelToJson(KidListModel data) => json.encode(data.toJson());

class KidListModel {
  bool isSuccess;
  int code;
  String message;
  List<AddKid> kidList;

  KidListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.kidList,
  });

  factory KidListModel.fromJson(Map<String, dynamic> json) => KidListModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    kidList: List<AddKid>.from(json["result"].map((x) => AddKid.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "kidList": List<dynamic>.from(kidList.map((x) => x.toJson())),
  };
}