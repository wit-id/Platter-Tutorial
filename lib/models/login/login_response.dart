import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.data,
    this.code,
    this.message,
    this.metadata,
  });

  String data;
  int code;
  String message;
  dynamic metadata;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json["data"],
        code: json["code"],
        message: json["message"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "code": code,
        "message": message,
        "metadata": metadata,
      };
}