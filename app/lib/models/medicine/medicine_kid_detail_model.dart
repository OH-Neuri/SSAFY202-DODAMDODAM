// To parse this JSON data, do
//
//     final medicineKidDetailModel = medicineKidDetailModelFromJson(jsonString);

import 'dart:convert';

MedicineKidDetailModel medicineKidDetailModelFromJson(String str) => MedicineKidDetailModel.fromJson(json.decode(str));

String medicineKidDetailModelToJson(MedicineKidDetailModel data) => json.encode(data.toJson());

class MedicineKidDetailModel {
  bool isSuccess;
  int code;
  String message;
  MedicineKidDetail medicineKidDetail;

  MedicineKidDetailModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.medicineKidDetail,
  });

  factory MedicineKidDetailModel.fromJson(Map<String, dynamic> json) => MedicineKidDetailModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    medicineKidDetail: MedicineKidDetail.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "medicineKidDetail": medicineKidDetail.toJson(),
  };
}

class MedicineKidDetail {
  int medicineSeq;
  int kidSeq;
  String symptom;
  String pill;
  String capacity;
  String count;
  String time;
  dynamic keep;
  String content;
  int requestDate;
  String requestName;
  String requestSign;
  int responseDate;
  String responseName;
  String responseSign;

  MedicineKidDetail({
    required this.medicineSeq,
    required this.kidSeq,
    required this.symptom,
    required this.pill,
    required this.capacity,
    required this.count,
    required this.time,
    this.keep,
    required this.content,
    required this.requestDate,
    required this.requestName,
    required this.requestSign,
    required this.responseDate,
    required this.responseName,
    required this.responseSign,
  });

  factory MedicineKidDetail.fromJson(Map<String, dynamic> json) => MedicineKidDetail(
    medicineSeq: json["medicineSeq"],
    kidSeq: json["kidSeq"],
    symptom: json["symptom"],
    pill: json["pill"],
    capacity: json["capacity"],
    count: json["count"],
    time: json["time"],
    keep: json["keep"],
    content: json["content"],
    requestDate: json["requestDate"],
    requestName: json["requestName"],
    requestSign: json["requestSign"],
    responseDate: json["responseDate"],
    responseName: json["responseName"],
    responseSign: json["responseSign"],
  );

  Map<String, dynamic> toJson() => {
    "medicineSeq": medicineSeq,
    "kidSeq": kidSeq,
    "symptom": symptom,
    "pill": pill,
    "capacity": capacity,
    "count": count,
    "time": time,
    "keep": keep,
    "content": content,
    "requestDate": requestDate,
    "requestName": requestName,
    "requestSign": requestSign,
    "responseDate": responseDate,
    "responseName": responseName,
    "responseSign": responseSign,
  };
}
