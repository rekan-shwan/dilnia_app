import 'dart:convert';

class TravelInsuranceDetailsModel {
  final bool? success;
  final String? message;
  final TravelInsuranceDetailsModelData? data;

  TravelInsuranceDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory TravelInsuranceDetailsModel.fromJson(String str) =>
      TravelInsuranceDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelInsuranceDetailsModel.fromMap(Map<String, dynamic> json) =>
      TravelInsuranceDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : TravelInsuranceDetailsModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class TravelInsuranceDetailsModelData {
  final DataData? data;
  final List<TravelDataPackage>? package;

  TravelInsuranceDetailsModelData({
    this.data,
    this.package,
  });

  factory TravelInsuranceDetailsModelData.fromJson(String str) =>
      TravelInsuranceDetailsModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelInsuranceDetailsModelData.fromMap(Map<String, dynamic> json) =>
      TravelInsuranceDetailsModelData(
        data: json["data"] == null ? null : DataData.fromMap(json["data"]),
        package: json["package"] == null
            ? []
            : List<TravelDataPackage>.from(
                json["package"]!.map((x) => TravelDataPackage.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "package": package == null
            ? []
            : List<dynamic>.from(package!.map((x) => x.toMap())),
      };
}

class DataData {
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
  final dynamic isInstallment;
  final String? agreement;
  final dynamic rate;
  final int? minimumRule;
  final int? discount;
  final int? createdBy;
  final int? updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  DataData({
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
    this.isInstallment,
    this.discount,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  factory DataData.fromJson(String str) => DataData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataData.fromMap(Map<String, dynamic> json) => DataData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        descriptionKr: json["description_kr"],
        isInstallment: json["is_installment"],
        image: json["image"],
        status: json["status"],
        termCondition: json["term_condition"],
        termConditionAr: json["term_condition_ar"],
        termConditionKr: json["term_condition_kr"],
        agreement: json["agreement"],
        rate: json["rate"],
        minimumRule: json["minimum_rule"],
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

class TravelDataPackage {
  final String? plan;
  final List<PackagePackage>? packages;

  TravelDataPackage({
    this.plan,
    this.packages,
  });

  factory TravelDataPackage.fromJson(String str) =>
      TravelDataPackage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelDataPackage.fromMap(Map<String, dynamic> json) =>
      TravelDataPackage(
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
  final String? category;
  final String? plan;
  final int? ageFrom;
  final int? ageTo;
  final int? periodFrom;
  final int? periodTo;
  final int? price;

  PackagePackage({
    this.id,
    this.category,
    this.plan,
    this.ageFrom,
    this.ageTo,
    this.periodFrom,
    this.periodTo,
    this.price,
  });

  factory PackagePackage.fromJson(String str) =>
      PackagePackage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackagePackage.fromMap(Map<String, dynamic> json) => PackagePackage(
        id: json["id"],
        category: json["category"],
        plan: json["plan"],
        ageFrom: json["age_from"],
        ageTo: json["age_to"],
        periodFrom: json["period_from"],
        periodTo: json["period_to"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "plan": plan,
        "age_from": ageFrom,
        "age_to": ageTo,
        "period_from": periodFrom,
        "period_to": periodTo,
        "price": price,
      };
}
