import 'dart:convert';

SigledayFood sigledayFoodFromJson(String str) => SigledayFood.fromJson(json.decode(str));

String sigledayFoodToJson(SigledayFood data) => json.encode(data.toJson());

class SigledayFood {
  bool isSuccess;
  int code;
  String message;
  OneDayFood oneDayFood;

  SigledayFood({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.oneDayFood,
  });

  factory SigledayFood.fromJson(Map<String, dynamic> json) => SigledayFood(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    oneDayFood: OneDayFood.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "oneDayFood": oneDayFood.toJson(),
  };
}

class OneDayFood {
  int foodSeq;
  dynamic rice;
  dynamic soup;
  dynamic dish1;
  dynamic dish2;
  dynamic dish3;
  dynamic morningSnack1;
  dynamic morningSnack2;
  dynamic afternoonSnack1;
  dynamic afternoonSnack2;

  OneDayFood({
    required this.foodSeq,
    required this.rice,
    required this.soup,
    required this.dish1,
    required this.dish2,
    required this.dish3,
    required this.morningSnack1,
    required this.morningSnack2,
    required this.afternoonSnack1,
    required this.afternoonSnack2,
  });

  factory OneDayFood.fromJson(Map<String, dynamic> json) => OneDayFood(
    foodSeq: json["foodSeq"],
    rice: json["rice"],
    soup: json["soup"],
    dish1: json["dish1"],
    dish2: json["dish2"],
    dish3: json["dish3"],
    morningSnack1: json["morningSnack1"],
    morningSnack2: json["morningSnack2"],
    afternoonSnack1: json["afternoonSnack1"],
    afternoonSnack2: json["afternoonSnack2"],
  );

  Map<String, dynamic> toJson() => {
    "foodSeq": foodSeq,
    "rice": rice,
    "soup": soup,
    "dish1": dish1,
    "dish2": dish2,
    "dish3": dish3,
    "morningSnack1": morningSnack1,
    "morningSnack2": morningSnack2,
    "afternoonSnack1": afternoonSnack1,
    "afternoonSnack2": afternoonSnack2,
  };
}
