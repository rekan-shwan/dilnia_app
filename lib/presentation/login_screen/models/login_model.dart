/// This class defines the variables used in the [login_screen],
/// and is typically used to hold data that is passed between different parts of the application.

/// This class defines the variables used in the [login_active_screen],
/// and is typically used to hold data that is passed between different parts of the application.

import 'dart:convert';

class LoginModel {
  final bool? success;
  final String? message;
  final Data? data;

  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final String? accessToken;
  final String? tokenType;
  final UserInfo? userInfo;

  Data({
    this.accessToken,
    this.tokenType,
    this.userInfo,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        userInfo: json["userInfo"] == null
            ? null
            : UserInfo.fromMap(json["userInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "userInfo": userInfo?.toMap(),
      };
}

class UserInfo {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic imagePath;
  final Role? role;

  UserInfo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.imagePath,
    this.role,
  });

  factory UserInfo.fromJson(String str) => UserInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserInfo.fromMap(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        imagePath: json["image_path"],
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image_path": imagePath,
        "role": role?.toMap(),
      };
}

class Role {
  final int? id;
  final String? name;

  Role({
    this.id,
    this.name,
  });

  factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
