// To parse this JSON data, do
//
//     final medicineClassListModel = medicineClassListModelFromJson(jsonString);

import 'dart:convert';

MedicineClassListModel medicineClassListModelFromJson(String str) => MedicineClassListModel.fromJson(json.decode(str));

String medicineClassListModelToJson(MedicineClassListModel data) => json.encode(data.toJson());

class MedicineClassListModel {
  bool isSuccess;
  int code;
  String message;
  MedicineClassList medicineClassList;

  MedicineClassListModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.medicineClassList,
  });

  factory MedicineClassListModel.fromJson(Map<String, dynamic> json) => MedicineClassListModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    medicineClassList: MedicineClassList.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "medicineClassList": medicineClassList.toJson(),
  };
}

class MedicineClassList {
  int medicineSeq;
  String name;
  String responseDate;

  MedicineClassList({
    required this.medicineSeq,
    required this.name,
    required this.responseDate,
  });

  factory MedicineClassList.fromJson(Map<String, dynamic> json) => MedicineClassList(
    medicineSeq: json["medicineSeq"],
    name: json["name"],
    responseDate: json["responseDate"],
  );

  Map<String, dynamic> toJson() => {
    "medicineSeq": medicineSeq,
    "name": name,
    "responseDate": responseDate,
  };
}
