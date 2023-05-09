import 'dart:convert';

SignupUserModel signupUserModelFromJson(String str) => SignupUserModel.fromJson(json.decode(str));

String signupUserModelToJson(SignupUserModel data) => json.encode(data.toJson());

class SignupUserModel {
  String id;
  String password;
  String phone;
  String name;
  int role;

  SignupUserModel({
    required this.id,
    required this.password,
    required this.phone,
    required this.name,
    required this.role,
  });

  factory SignupUserModel.fromJson(Map<String, dynamic> json) => SignupUserModel(
    id: json["id"],
    password: json["password"],
    phone: json["phone"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "phone": phone,
    "name": name,
    "role": role,
  };
}
