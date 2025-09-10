import 'dart:convert';

class MedicalInsuranceDetailsModel {
  final bool? success;
  final String? message;
  final MedicalInsuranceDetailsModelData? data;

  MedicalInsuranceDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory MedicalInsuranceDetailsModel.fromJson(String str) =>
      MedicalInsuranceDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalInsuranceDetailsModel.fromMap(Map<String, dynamic> json) =>
      MedicalInsuranceDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : MedicalInsuranceDetailsModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class MedicalInsuranceDetailsModelData {
  final MedicalInsuranceData? data;
  final List<MedicalDataPackage>? package;

  MedicalInsuranceDetailsModelData({
    this.data,
    this.package,
  });

  factory MedicalInsuranceDetailsModelData.fromJson(String str) =>
      MedicalInsuranceDetailsModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalInsuranceDetailsModelData.fromMap(Map<String, dynamic> json) =>
      MedicalInsuranceDetailsModelData(
        data: json["data"] == null
            ? null
            : MedicalInsuranceData.fromMap(json["data"]),
        package: json["package"] == null
            ? []
            : List<MedicalDataPackage>.from(
                json["package"]!.map((x) => MedicalDataPackage.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "package": package == null
            ? []
            : List<dynamic>.from(package!.map((x) => x.toMap())),
      };
}

class MedicalInsuranceData {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final String? descriptionAr;
  final String? descriptionKr;
  final dynamic image;
  final int? status;
  final String? termCondition;
  final String? termConditionAr;
  final String? termConditionKr;
  final String? agreement;
  final dynamic rate;
  final int? minimumRule;
  final int? discount;
  final dynamic isInstallment;
  final dynamic installmentMonth;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  MedicalInsuranceData({
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

  factory MedicalInsuranceData.fromJson(String str) =>
      MedicalInsuranceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalInsuranceData.fromMap(Map<String, dynamic> json) =>
      MedicalInsuranceData(
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
        rate: json["rate"],
        minimumRule: json["minimum_rule"],
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

class MedicalDataPackage {
  final int? plan;
  final List<PackagePackage>? packages;

  MedicalDataPackage({
    this.plan,
    this.packages,
  });

  factory MedicalDataPackage.fromJson(String str) =>
      MedicalDataPackage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalDataPackage.fromMap(Map<String, dynamic> json) =>
      MedicalDataPackage(
        plan: json["plan"],
        packages: json["packages"] == null
            ? []
            : List<PackagePackage>.from(
                json["packages"]!.map((x) => PackagePackage.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "plan": plan,
        "packages": packages == null
            ? []
            : List<dynamic>.from(packages!.map((x) => x.toMap())),
      };
}

class PackagePackage {
  final int? id;
  final int? status;
  final String? slug;
  final String? name;
  final String? plan;
  final int? age;
  final dynamic price;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PackagePackage({
    this.id,
    this.status,
    this.slug,
    this.name,
    this.plan,
    this.age,
    this.price,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory PackagePackage.fromJson(String str) =>
      PackagePackage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackagePackage.fromMap(Map<String, dynamic> json) => PackagePackage(
        id: json["id"],
        status: json["status"],
        slug: json["slug"],
        name: json["name"],
        plan: json["plan"],
        age: json["age"],
        price: json["price"],
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
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "slug": slug,
        "name": name,
        "plan": plan,
        "age": age,
        "price": price,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
