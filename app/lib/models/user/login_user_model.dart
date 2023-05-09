import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  String id;
  String password;
  int role;

  LoginUserModel({
    required this.id,
    required this.password,
    required this.role,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
    id: json["id"],
    password: json["password"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "role": role,
  };
}
