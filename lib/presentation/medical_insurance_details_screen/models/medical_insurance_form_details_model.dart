import 'dart:convert';

import '../../home_insurance_details/models/home_insurance_form_details_model.dart';

class MedicalFormDetailsModel {
  final bool? success;
  final String? message;
  final MedicalInsuranceDetailsData? data;

  MedicalFormDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory MedicalFormDetailsModel.fromJson(String str) =>
      MedicalFormDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalFormDetailsModel.fromMap(Map<String, dynamic> json) =>
      MedicalFormDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : MedicalInsuranceDetailsData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class MedicalInsuranceDetailsData {
  final dynamic id;
  final String? name;
  final String? slug;
  final DateTime? dob;
  final String? gender;
  final String? email;
  final String? phone;
  final dynamic forOwn;
  final String? planType;
  final dynamic medicalInsurancePackageId;
  final String? coverageArea;
  final DateTime? start;
  final DateTime? end;
  final dynamic premium;
  final dynamic totalPremium;
  final String? description;
  final dynamic document;
  final dynamic documentApprove;
  final dynamic image;
  final dynamic paymentMethodId;
  final String? discountCode;
  final String? note;
  final dynamic comment;
  final dynamic isPaid;
  final dynamic isEditable;
  final dynamic status;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;
  final dynamic documentPath;
  final List<dynamic>? images;
  final List<Family>? family;
  final List<UserPayment>? userPayment;
  final MedicalInsurancePackage? medicalInsurancePackage;
  MedicalInsuranceDetailsData({
    this.id,
    this.name,
    this.slug,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.forOwn,
    this.planType,
    this.medicalInsurancePackageId,
    this.coverageArea,
    this.start,
    this.end,
    this.premium,
    this.totalPremium,
    this.description,
    this.document,
    this.documentApprove,
    this.image,
    this.paymentMethodId,
    this.discountCode,
    this.note,
    this.comment,
    this.isPaid,
    this.isEditable,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.documentPath,
    this.images,
    this.family,
    this.userPayment,
    this.medicalInsurancePackage,
  });

  factory MedicalInsuranceDetailsData.fromJson(String str) =>
      MedicalInsuranceDetailsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalInsuranceDetailsData.fromMap(Map<String, dynamic> json) =>
      MedicalInsuranceDetailsData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        forOwn: json["for_own"],
        planType: json["plan_type"],
        medicalInsurancePackageId: json["medical_insurance_package_id"],
        coverageArea: json["coverage_area"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        premium: json["premium"],
        totalPremium: json["total_premium"],
        description: json["description"],
        document: json["document"],
        documentApprove: json["document_approve"],
        image: json["image"],
        paymentMethodId: json["payment_method_id"],
        discountCode: json["discount_code"],
        note: json["note"],
        comment: json["comment"],
        isPaid: json["is_paid"],
        isEditable: json["is_editable"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imagePath: json["image_path"],
        documentPath: json["document_path"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        family: json["family"] == null
            ? []
            : List<Family>.from(json["family"]!.map((x) => Family.fromMap(x))),
        userPayment: json["user_payment"] == null
            ? []
            : List<UserPayment>.from(
                json["user_payment"]!.map((x) => UserPayment.fromMap(x))),
        medicalInsurancePackage: json["medical_insurance_package"] == null
            ? null
            : MedicalInsurancePackage.fromJson(
                json["medical_insurance_package"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "dob": dob?.toIso8601String(),
        "gender": gender,
        "email": email,
        "phone": phone,
        "for_own": forOwn,
        "plan_type": planType,
        "medical_insurance_package_id": medicalInsurancePackageId,
        "coverage_area": coverageArea,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "premium": premium,
        "total_premium": totalPremium,
        "description": description,
        "document": document,
        "document_approve": documentApprove,
        "image": image,
        "payment_method_id": paymentMethodId,
        "discount_code": discountCode,
        "note": note,
        "comment": comment,
        "is_paid": isPaid,
        "is_editable": isEditable,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
        "document_path": documentPath,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "family": family == null
            ? []
            : List<dynamic>.from(family!.map((x) => x.toMap())),
        "medical_insurance_package": medicalInsurancePackage?.toJson(),
      };
}

class Family {
  final dynamic id;
  final String? name;
  final String? slug;
  final DateTime? dob;
  final String? gender;
  final String? email;
  final String? phone;
  final String? relation;
  final dynamic premium;
  final dynamic medicalInsuranceFormId;
  final dynamic medicalInsurancePackageId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Family({
    this.id,
    this.name,
    this.slug,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.relation,
    this.premium,
    this.medicalInsuranceFormId,
    this.medicalInsurancePackageId,
    this.createdAt,
    this.updatedAt,
  });

  factory Family.fromJson(String str) => Family.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Family.fromMap(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        relation: json["relation"],
        premium: json["premium"],
        medicalInsuranceFormId: json["medical_insurance_form_id"],
        medicalInsurancePackageId: json["medical_insurance_package_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "dob": dob?.toIso8601String(),
        "gender": gender,
        "email": email,
        "phone": phone,
        "relation": relation,
        "premium": premium,
        "medical_insurance_form_id": medicalInsuranceFormId,
        "medical_insurance_package_id": medicalInsurancePackageId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class MedicalInsurancePackage {
  final int? id;
  final int? status;
  final String? slug;
  final String? name;
  final String? plan;
  final int? age;
  final int? price;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MedicalInsurancePackage({
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

  factory MedicalInsurancePackage.fromRawJson(String str) =>
      MedicalInsurancePackage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicalInsurancePackage.fromJson(Map<String, dynamic> json) =>
      MedicalInsurancePackage(
        id: json["id"],
        status: json["status"],
        slug: json["slug"],
        name: json["name"] ?? '',
        plan: json["plan"] ?? '',
        age: json["age"] ?? 0,
        price: json["price"] ?? 0,
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

  Map<String, dynamic> toJson() => {
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
