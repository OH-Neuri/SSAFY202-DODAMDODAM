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
  List<MedicineClassList> medicineClassList;

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
    medicineClassList: List<MedicineClassList>.from(json["result"].map((x) => MedicineClassList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "medicineClassList":List<dynamic>.from(medicineClassList.map((x) => x.toJson())),
  };
}

class MedicineClassList {
  int medicineSeq;
  String name;
  String photo;
  dynamic responseDate;

  MedicineClassList({
    required this.medicineSeq,
    required this.name,
    required this.photo,
    this.responseDate,
  });

  factory MedicineClassList.fromJson(Map<String, dynamic> json) => MedicineClassList(
      medicineSeq: json["medicineSeq"],
      name: json["name"],
      responseDate: json["responseDate"],
      photo: json['photo']
  );

  Map<String, dynamic> toJson() => {
    "medicineSeq": medicineSeq,
    "name": name,
    "responseDate": responseDate,
    "photo": photo
  };
}
