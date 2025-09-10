import 'dart:convert';

class CarInsuranceFromResponse {
  final bool? success;
  final String? message;
  final CarInsuranceFromResponseData? data;

  CarInsuranceFromResponse({
    this.success,
    this.message,
    this.data,
  });

  factory CarInsuranceFromResponse.fromJson(String str) =>
      CarInsuranceFromResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarInsuranceFromResponse.fromMap(Map<String, dynamic> json) =>
      CarInsuranceFromResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : CarInsuranceFromResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class CarInsuranceFromResponseData {
  final DataData? data;
  final List<PaymentDatum>? paymentData;

  CarInsuranceFromResponseData({
    this.data,
    this.paymentData,
  });

  factory CarInsuranceFromResponseData.fromJson(String str) =>
      CarInsuranceFromResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarInsuranceFromResponseData.fromMap(Map<String, dynamic> json) =>
      CarInsuranceFromResponseData(
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
  final String? carBrand;
  final String? carModel;
  final String? manufactureYear;
  final String? chassisNumber;
  final String? plan;
  final String? carValue;
  final String? personalAccidentCoverage;
  final String? roadsideAssistance;
  final DateTime? start;
  final DateTime? end;
  final String? totalPremium;
  final dynamic ownerIdDocument;
  final dynamic carRegistrationDocument;
  final String? discountCode;
  final String? discountAmount;
  final String? isInstallment;
  final String? installmentMonth;
  final int? minimumPremium;
  final String? note;
  final String? description;
  final int? createdBy;
  final String? slug;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final String? imagePath;
  final dynamic carRegistrationDocumentPath;
  final dynamic ownerIdDocumentPath;

  DataData({
    this.name,
    this.dob,
    this.gender,
    this.phone,
    this.email,
    this.forOwn,
    this.image,
    this.carBrand,
    this.carModel,
    this.manufactureYear,
    this.chassisNumber,
    this.plan,
    this.carValue,
    this.personalAccidentCoverage,
    this.roadsideAssistance,
    this.start,
    this.end,
    this.totalPremium,
    this.ownerIdDocument,
    this.carRegistrationDocument,
    this.discountCode,
    this.discountAmount,
    this.isInstallment,
    this.installmentMonth,
    this.minimumPremium,
    this.note,
    this.description,
    this.createdBy,
    this.slug,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.imagePath,
    this.carRegistrationDocumentPath,
    this.ownerIdDocumentPath,
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
        carBrand: json["car_brand"],
        carModel: json["car_model"],
        manufactureYear: json["manufacture_year"],
        chassisNumber: json["chassis_number"],
        plan: json["plan"],
        carValue: json["car_value"],
        personalAccidentCoverage: json["personal_accident_coverage"],
        roadsideAssistance: json["roadside_assistance"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        totalPremium: json["total_premium"],
        ownerIdDocument: json["owner_id_document"],
        carRegistrationDocument: json["car_registration_document"],
        discountCode: json["discount_code"],
        discountAmount: json["discount_amount"],
        isInstallment: json["is_installment"],
        installmentMonth: json["installment_month"],
        minimumPremium: json["minimum_premium"],
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
        carRegistrationDocumentPath: json["car_registration_document_path"],
        ownerIdDocumentPath: json["owner_id_document_path"],
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
        "car_brand": carBrand,
        "car_model": carModel,
        "manufacture_year": manufactureYear,
        "chassis_number": chassisNumber,
        "plan": plan,
        "car_value": carValue,
        "personal_accident_coverage": personalAccidentCoverage,
        "roadside_assistance": roadsideAssistance,
        "start":
            "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "total_premium": totalPremium,
        "owner_id_document": ownerIdDocument,
        "car_registration_document": carRegistrationDocument,
        "discount_code": discountCode,
        "discount_amount": discountAmount,
        "is_installment": isInstallment,
        "installment_month": installmentMonth,
        "minimum_premium": minimumPremium,
        "note": note,
        "description": description,
        "created_by": createdBy,
        "slug": slug,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "image_path": imagePath,
        "car_registration_document_path": carRegistrationDocumentPath,
        "owner_id_document_path": ownerIdDocumentPath,
      };
}

class PaymentDatum {
  final String? name;
  final String? description;
  final String? packageType;
  final int? carFormId;
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
    this.carFormId,
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
        carFormId: json["car_form_id"],
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
        "car_form_id": carFormId,
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
