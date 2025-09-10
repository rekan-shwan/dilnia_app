import 'dart:convert';

class MedicalFormResponse {
  final bool? success;
  final String? message;
  final MedicalFormResponseData? data;

  MedicalFormResponse({
    this.success,
    this.message,
    this.data,
  });

  factory MedicalFormResponse.fromJson(String str) =>
      MedicalFormResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalFormResponse.fromMap(Map<String, dynamic> json) =>
      MedicalFormResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : MedicalFormResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class MedicalFormResponseData {
  final DataData? data;
  final List<PaymentDatum>? paymentData;

  MedicalFormResponseData({
    this.data,
    this.paymentData,
  });

  factory MedicalFormResponseData.fromJson(String str) =>
      MedicalFormResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalFormResponseData.fromMap(Map<String, dynamic> json) =>
      MedicalFormResponseData(
        data: json["data"] == null ? null : DataData.fromMap(json["data"]),
        paymentData: json["paymentData"] == null
            ? []
            : List<PaymentDatum>.from(
                json["paymentData"]!.map((x) => PaymentDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "paymentData": paymentData == null
            ? []
            : List<dynamic>.from(paymentData!.map((x) => x.toMap())),
      };
}

class DataData {
  final String? name;
  final DateTime? dob;
  final String? gender;
  final String? phone;
  final String? email;
  final String? forOwn;
  final dynamic image;
  final String? planType;
  final String? coverageArea;
  final DateTime? start;
  final DateTime? end;
  final String? totalPremium;
  final dynamic document;
  final String? discountCode;
  final String? discountAmount;
  final dynamic medicalCondition;
  final String? medicalInsurancePackageId;
  final int? premium;
  final String? isInstallment;
  final String? installmentMonth;
  final String? note;
  final String? description;
  final int? createdBy;
  final String? slug;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final String? imagePath;
  final dynamic documentPath;

  DataData({
    this.name,
    this.dob,
    this.gender,
    this.phone,
    this.email,
    this.forOwn,
    this.image,
    this.planType,
    this.coverageArea,
    this.start,
    this.end,
    this.totalPremium,
    this.document,
    this.discountCode,
    this.discountAmount,
    this.medicalCondition,
    this.medicalInsurancePackageId,
    this.premium,
    this.isInstallment,
    this.installmentMonth,
    this.note,
    this.description,
    this.createdBy,
    this.slug,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.imagePath,
    this.documentPath,
  });

  factory DataData.fromJson(String str) => DataData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataData.fromMap(Map<String, dynamic> json) => DataData(
        name: json["name"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        phone: json["phone"],
        email: json["email"],
        forOwn: json["for_own"],
        image: json["image"],
        planType: json["plan_type"],
        coverageArea: json["coverage_area"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        totalPremium: json["total_premium"],
        document: json["document"],
        discountCode: json["discount_code"],
        discountAmount: json["discount_amount"],
        medicalCondition: json["medical_condition"],
        medicalInsurancePackageId: json["medical_insurance_package_id"],
        premium: json["premium"],
        isInstallment: json["is_installment"],
        installmentMonth: json["installment_month"],
        note: json["note"],
        description: json["description"],
        createdBy: json["created_by"],
        slug: json["slug"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        imagePath: json["image_path"],
        documentPath: json["document_path"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "email": email,
        "for_own": forOwn,
        "image": image,
        "plan_type": planType,
        "coverage_area": coverageArea,
        "start":
            "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "total_premium": totalPremium,
        "document": document,
        "discount_code": discountCode,
        "discount_amount": discountAmount,
        "medical_condition": medicalCondition,
        "medical_insurance_package_id": medicalInsurancePackageId,
        "premium": premium,
        "is_installment": isInstallment,
        "installment_month": installmentMonth,
        "note": note,
        "description": description,
        "created_by": createdBy,
        "slug": slug,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "image_path": imagePath,
        "document_path": documentPath,
      };
}

class PaymentDatum {
  final String? name;
  final String? description;
  final String? packageType;
  final int? medicalFormId;
  final String? isInstallment;
  final String? amount;
  final int? isPaid;
  final DateTime? startDate;
  final DateTime? expireDate;
  final int? userId;
  final int? createdBy;
  final String? slug;
  final String? invoice;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  PaymentDatum({
    this.name,
    this.description,
    this.packageType,
    this.medicalFormId,
    this.isInstallment,
    this.amount,
    this.isPaid,
    this.startDate,
    this.expireDate,
    this.userId,
    this.createdBy,
    this.slug,
    this.invoice,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory PaymentDatum.fromJson(String str) =>
      PaymentDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentDatum.fromMap(Map<String, dynamic> json) => PaymentDatum(
        name: json["name"],
        description: json["description"],
        packageType: json["package_type"],
        medicalFormId: json["medical_form_id"],
        isInstallment: json["is_installment"],
        amount: json["amount"],
        isPaid: json["is_paid"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        userId: json["user_id"],
        createdBy: json["created_by"],
        slug: json["slug"],
        invoice: json["invoice"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "package_type": packageType,
        "medical_form_id": medicalFormId,
        "is_installment": isInstallment,
        "amount": amount,
        "is_paid": isPaid,
        "start_date": startDate?.toIso8601String(),
        "expire_date": expireDate?.toIso8601String(),
        "user_id": userId,
        "created_by": createdBy,
        "slug": slug,
        "invoice": invoice,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
