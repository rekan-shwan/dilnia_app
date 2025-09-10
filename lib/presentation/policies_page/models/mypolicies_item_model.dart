import 'dart:convert';

class InsuranceListModel {
  final bool? success;
  final String? message;
  final List<InsuranceData>? data;

  InsuranceListModel({
    this.success,
    this.message,
    this.data,
  });

  factory InsuranceListModel.fromJson(String str) =>
      InsuranceListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InsuranceListModel.fromMap(Map<String, dynamic> json) =>
      InsuranceListModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<InsuranceData>.from(
                json["data"]!.map((x) => InsuranceData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class InsuranceData {
  final dynamic id;
  final dynamic totalPremium;
  final dynamic status;
  final String? note;
  final dynamic isPaid;
  final DateTime? createdAt;
  final String? insurance;
  final String? title;
  InsuranceData({
    this.id,
    this.totalPremium,
    this.status,
    this.note,
    this.isPaid,
    this.createdAt,
    this.insurance,
    this.title,
  });

  factory InsuranceData.fromJson(String str) =>
      InsuranceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InsuranceData.fromMap(Map<String, dynamic> json) => InsuranceData(
        id: json["id"],
        totalPremium: json["total_premium"],
        status: json["status"],
        note: json["note"],
        isPaid: json["is_paid"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        insurance: json["insurance"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "total_premium": totalPremium,
        "status": status,
        "note": note,
        "is_paid": isPaid,
        "created_at": createdAt?.toIso8601String(),
        "insurance": insurance,
        "title": title,
      };
}
