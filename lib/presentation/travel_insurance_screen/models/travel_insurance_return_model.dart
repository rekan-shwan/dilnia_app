import 'dart:convert';

class TravelFormResponse {
  final bool? success;
  final String? message;
  final TravelFormResponseData? data;

  TravelFormResponse({
    this.success,
    this.message,
    this.data,
  });

  factory TravelFormResponse.fromJson(String str) =>
      TravelFormResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelFormResponse.fromMap(Map<String, dynamic> json) =>
      TravelFormResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : TravelFormResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class TravelFormResponseData {
  final DataData? data;
  final List<PaymentDatum>? paymentData;

  TravelFormResponseData({
    this.data,
    this.paymentData,
  });

  factory TravelFormResponseData.fromJson(String str) =>
      TravelFormResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelFormResponseData.fromMap(Map<String, dynamic> json) =>
      TravelFormResponseData(
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
  final String? middleName;
  final String? lastName;
  final DateTime? dob;
  final String? gender;
  final String? phone;
  final dynamic phoneCode;
  final String? email;
  final String? nationality;
  final String? passportNumber;
  final String? forOwn;
  final dynamic image;
  final String? planType;
  final String? period;
  final DateTime? start;
  final DateTime? end;
  final String? adultsNumber;
  final String? childNumber;
  final String? destination;
  final String? purpose;
  final String? totalPremium;
  final dynamic document;
  final dynamic passportDocument;
  final String? discountCode;
  final String? discountAmount;
  final String? travelInsurancePackageId;
  final int? premium;
  final String? note;
  final String? description;
  final String? isInstallment;
  final String? installmentMonth;
  final int? createdBy;
  final String? slug;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final dynamic imagePath;
  final dynamic documentPath;
  final dynamic passportDocumentPath;

  DataData({
    this.name,
    this.middleName,
    this.lastName,
    this.dob,
    this.gender,
    this.phone,
    this.phoneCode,
    this.email,
    this.nationality,
    this.passportNumber,
    this.forOwn,
    this.image,
    this.planType,
    this.period,
    this.start,
    this.end,
    this.adultsNumber,
    this.childNumber,
    this.destination,
    this.purpose,
    this.totalPremium,
    this.document,
    this.passportDocument,
    this.discountCode,
    this.discountAmount,
    this.travelInsurancePackageId,
    this.premium,
    this.note,
    this.description,
    this.isInstallment,
    this.installmentMonth,
    this.createdBy,
    this.slug,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.imagePath,
    this.documentPath,
    this.passportDocumentPath,
  });

  factory DataData.fromJson(String str) => DataData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataData.fromMap(Map<String, dynamic> json) => DataData(
        name: json["name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        phone: json["phone"],
        phoneCode: json["phone_code"],
        email: json["email"],
        nationality: json["nationality"],
        passportNumber: json["passport_number"],
        forOwn: json["for_own"],
        image: json["image"],
        planType: json["plan_type"],
        period: json["period"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        adultsNumber: json["adults_number"],
        childNumber: json["child_number"],
        destination: json["destination"],
        purpose: json["purpose"],
        totalPremium: json["total_premium"],
        document: json["document"],
        passportDocument: json["passport_document"],
        discountCode: json["discount_code"],
        discountAmount: json["discount_amount"],
        travelInsurancePackageId: json["travel_insurance_package_id"],
        premium: json["premium"],
        note: json["note"],
        description: json["description"],
        isInstallment: json["is_installment"],
        installmentMonth: json["installment_month"],
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
        passportDocumentPath: json["passport_document_path"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "middle_name": middleName,
        "last_name": lastName,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "phone_code": phoneCode,
        "email": email,
        "nationality": nationality,
        "passport_number": passportNumber,
        "for_own": forOwn,
        "image": image,
        "plan_type": planType,
        "period": period,
        "start":
            "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "adults_number": adultsNumber,
        "child_number": childNumber,
        "destination": destination,
        "purpose": purpose,
        "total_premium": totalPremium,
        "document": document,
        "passport_document": passportDocument,
        "discount_code": discountCode,
        "discount_amount": discountAmount,
        "travel_insurance_package_id": travelInsurancePackageId,
        "premium": premium,
        "note": note,
        "description": description,
        "is_installment": isInstallment,
        "installment_month": installmentMonth,
        "created_by": createdBy,
        "slug": slug,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "image_path": imagePath,
        "document_path": documentPath,
        "passport_document_path": passportDocumentPath,
      };
}

class PaymentDatum {
  final String? name;
  final String? description;
  final String? packageType;
  final int? travelFormId;
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
    this.travelFormId,
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
        travelFormId: json["travel_form_id"],
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
        "travel_form_id": travelFormId,
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
