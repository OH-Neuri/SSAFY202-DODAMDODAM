import 'dart:convert';

ImageUrlModel imageUrlModelFromJson(String str) => ImageUrlModel.fromJson(json.decode(str));

String imageUrlModelToJson(ImageUrlModel data) => json.encode(data.toJson());

class ImageUrlModel {
  bool isSuccess;
  int code;
  String message;
  String result;

  ImageUrlModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.result,
  });

  factory ImageUrlModel.fromJson(Map<String, dynamic> json) => ImageUrlModel(
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