import 'dart:convert';

class HomeInsuranceDetailsModel {
  final bool? success;
  final String? message;
  final HomeInsuranceData? data;

  HomeInsuranceDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory HomeInsuranceDetailsModel.fromJson(String str) =>
      HomeInsuranceDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeInsuranceDetailsModel.fromMap(Map<String, dynamic> json) =>
      HomeInsuranceDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : HomeInsuranceData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class HomeInsuranceData {
  final dynamic id;
  final String? name;
  final String? slug;
  final String? description;
  final String? descriptionAr;
  final String? descriptionKr;
  final dynamic image;
  final dynamic status;
  final String? termCondition;
  final String? termConditionAr;
  final String? termConditionKr;
  final String? agreement;
  final dynamic rate;
  final dynamic minimumRule;
  final dynamic discount;
  final dynamic isInstallment;
  final dynamic installmentMonth;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  HomeInsuranceData({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.descriptionAr,
    this.descriptionKr,
    this.image,
    this.status,
    this.termCondition,
    this.termConditionAr,
    this.termConditionKr,
    this.agreement,
    this.rate,
    this.minimumRule,
    this.discount,
    this.isInstallment,
    this.installmentMonth,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  factory HomeInsuranceData.fromJson(String str) =>
      HomeInsuranceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeInsuranceData.fromMap(Map<String, dynamic> json) =>
      HomeInsuranceData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        descriptionKr: json["description_kr"],
        image: json["image"],
        status: json["status"],
        termCondition: json["term_condition"],
        termConditionAr: json["term_condition_ar"],
        termConditionKr: json["term_condition_kr"],
        agreement: json["agreement"],
        rate: json["rate"] ?? 0,
        minimumRule: json["minimum_rule"] ?? 0,
        discount: json["discount"],
        isInstallment: json["is_installment"],
        installmentMonth: json["installment_month"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "status": status,
        "term_condition": termCondition,
        "agreement": agreement,
        "rate": rate,
        "minimum_rule": minimumRule,
        "discount": discount,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
      };
}
