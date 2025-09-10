import 'dart:convert';

class CarInsuranceDetailsModel {
  final bool? success;
  final String? message;
  final Data? data;

  CarInsuranceDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory CarInsuranceDetailsModel.fromJson(String str) =>
      CarInsuranceDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarInsuranceDetailsModel.fromMap(Map<String, dynamic> json) =>
      CarInsuranceDetailsModel(
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
  final Insurance? insurance;
  final List<Brand>? brand;
  final List<Brand>? model;

  Data({
    this.insurance,
    this.brand,
    this.model,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        insurance: json["insurance"] == null
            ? null
            : Insurance.fromMap(json["insurance"]),
        brand: json["brand"] == null
            ? []
            : List<Brand>.from(json["brand"]!.map((x) => Brand.fromMap(x))),
        model: json["model"] == null
            ? []
            : List<Brand>.from(json["model"]!.map((x) => Brand.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "insurance": insurance?.toMap(),
        "brand": brand == null
            ? []
            : List<dynamic>.from(brand!.map((x) => x.toMap())),
        "model": model == null
            ? []
            : List<dynamic>.from(model!.map((x) => x.toMap())),
      };
}

class Brand {
  final int? id;
  final String? name;
  final String? slug;
  final String? nameAr;
  final String? nameKr;
  final String? description;
  final dynamic image;
  final int? status;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;
  final String? carBrandId;

  Brand({
    this.id,
    this.name,
    this.slug,
    this.nameAr,
    this.nameKr,
    this.description,
    this.image,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.carBrandId,
  });

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        nameAr: json["name_ar"],
        nameKr: json["name_kr"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
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
        carBrandId: json["car_brand_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "name_ar": nameAr,
        "name_kr": nameKr,
        "description": description,
        "image": image,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
        "car_brand_id": carBrandId,
      };
}

class Insurance {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final dynamic descriptionAr;
  final dynamic descriptionKr;
  final dynamic image;
  final int? status;
  final String? termCondition;
  final dynamic termConditionAr;
  final dynamic termConditionKr;
  final String? agreement;
  final dynamic agreementAr;
  final dynamic agreementKr;
  final double? aRate;
  final double? bRate;
  final double? cRate;
  final double? dRate;
  final int? aDeductible;
  final int? bDeductible;
  final int? cDeductible;
  final int? dDeductible;
  final int? minimumRule;
  final int? isInstallment;
  final int? installmentMonth;
  final int? discount;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  Insurance({
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
    this.agreementAr,
    this.agreementKr,
    this.aRate,
    this.bRate,
    this.cRate,
    this.dRate,
    this.aDeductible,
    this.bDeductible,
    this.cDeductible,
    this.dDeductible,
    this.minimumRule,
    this.isInstallment,
    this.installmentMonth,
    this.discount,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  factory Insurance.fromJson(String str) => Insurance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Insurance.fromMap(Map<String, dynamic> json) => Insurance(
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
        agreementAr: json["agreement_ar"],
        agreementKr: json["agreement_kr"],
        aRate: json["a_rate"]?.toDouble(),
        bRate: json["b_rate"]?.toDouble(),
        cRate: json["c_rate"]?.toDouble(),
        dRate: json["d_rate"]?.toDouble(),
        aDeductible: json["a_deductible"],
        bDeductible: json["b_deductible"],
        cDeductible: json["c_deductible"],
        dDeductible: json["d_deductible"],
        minimumRule: json["minimum_rule"],
        isInstallment: json["is_installment"],
        installmentMonth: json["installment_month"],
        discount: json["discount"],
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
        "description_ar": descriptionAr,
        "description_kr": descriptionKr,
        "image": image,
        "status": status,
        "term_condition": termCondition,
        "term_condition_ar": termConditionAr,
        "term_condition_kr": termConditionKr,
        "agreement": agreement,
        "agreement_ar": agreementAr,
        "agreement_kr": agreementKr,
        "a_rate": aRate,
        "b_rate": bRate,
        "c_rate": cRate,
        "d_rate": dRate,
        "a_deductible": aDeductible,
        "b_deductible": bDeductible,
        "c_deductible": cDeductible,
        "d_deductible": dDeductible,
        "minimum_rule": minimumRule,
        "is_installment": isInstallment,
        "installment_month": installmentMonth,
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
