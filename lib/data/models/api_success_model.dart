import 'dart:convert';

class ApiSuccessResponseModel {
  final bool? success;
  final String? message;
  final dynamic data;

  ApiSuccessResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory ApiSuccessResponseModel.fromJson(String str) =>
      ApiSuccessResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiSuccessResponseModel.fromMap(Map<String, dynamic> json) =>
      ApiSuccessResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
