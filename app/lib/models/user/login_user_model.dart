import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));

class LoginUserModel {
  bool isSuccess;
  int code;
  String message;
  LoginUser loginUser;

  LoginUserModel({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.loginUser,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
    isSuccess: json["isSuccess"],
    code: json["code"],
    message: json["message"],
    loginUser: LoginUser.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "code": code,
    "message": message,
    "loginUser": loginUser.toJson(),
  };
}

class LoginUser {
  String id;
  String name;
  int role;
  String phone;
  String token;

  LoginUser({
    required this.id,
    required this.name,
    required this.role,
    required this.phone,
    required this.token,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    phone: json["phone"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "phone": phone,
    "token": token,
  };
}