// To parse this JSON data, do
//
//     final medicineKidMonthModel = medicineKidMonthModelFromJson(jsonString);

import 'dart:convert';

MedicineKidMonthModel medicineKidMonthModelFromJson(String str) => MedicineKidMonthModel.fromJson(json.decode(str));

// String medicineKidMonthModelToJson(MedicineKidMonthModel data) => json.encode(data.toJson());

class MedicineKidMonthModel {
  bool isSuccess;
  int code;
  String message;
  List<MedicineKidMonth> medicineKidMonth;

  MedicineKidMonthModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.medicineKidMonth,
  });

  factory MedicineKidMonthModel.fromJson(Map<String, dynamic> json) => MedicineKidMonthModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    medicineKidMonth: List<MedicineKidMonth>.from(json["result"].map((x) => MedicineKidMonth.fromJson(x))),
  );

}

class MedicineKidMonth {
  DateTime requestDate;
  DateTime responseDate;

  MedicineKidMonth({
    required this.requestDate,
    required this.responseDate,
  });

  factory MedicineKidMonth.fromJson(Map<String, dynamic> json) => MedicineKidMonth(
    requestDate: DateTime.parse(json["requestDate"]),
    responseDate: DateTime.parse(json["responseDate"]),
  );

  Map<String, dynamic> toJson() => {
    "requestDate": requestDate.toIso8601String(),
    "responseDate": responseDate.toIso8601String(),
  };
}
