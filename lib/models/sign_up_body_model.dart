import 'dart:convert';

SignUpBody signUpBodyFromJson(String str) => SignUpBody.fromJson(json.decode(str));

String signUpBodyToJson(SignUpBody data) => json.encode(data.toJson());

class SignUpBody {

  String name;
  String phone;
  String email;
  String password;
  
  SignUpBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory SignUpBody.fromJson(Map<String, dynamic> json) => SignUpBody(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
  };
}
