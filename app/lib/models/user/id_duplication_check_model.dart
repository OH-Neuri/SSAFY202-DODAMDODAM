import 'dart:convert';

IdDuplicationCheckModel idDuplicationCheckModelFromJson(String str) => IdDuplicationCheckModel.fromJson(json.decode(str));

String idDuplicationCheckModelToJson(IdDuplicationCheckModel data) => json.encode(data.toJson());

class IdDuplicationCheckModel {
  bool isSuccess;
  int code;
  String message;
  bool result;

  IdDuplicationCheckModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.result,
  });

  factory IdDuplicationCheckModel.fromJson(Map<String, dynamic> json) => IdDuplicationCheckModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "result": result,
  };
}
