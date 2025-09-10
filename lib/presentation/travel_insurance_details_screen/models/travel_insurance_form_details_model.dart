import 'dart:convert';

import '../../home_insurance_details/models/home_insurance_form_details_model.dart';

class TravelFormDetailsModel {
  final bool? success;
  final String? message;
  final TravelInsuranceDetailsData? data;

  TravelFormDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory TravelFormDetailsModel.fromJson(String str) =>
      TravelFormDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelFormDetailsModel.fromMap(Map<String, dynamic> json) =>
      TravelFormDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : TravelInsuranceDetailsData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class TravelInsuranceDetailsData {
  final dynamic id;
  final String? name;
  final String? lastName;
  final String? middleName;
  final String? slug;
  final DateTime? dob;
  final String? gender;
  final String? email;
  final String? phone;
  final dynamic phoneCode;
  final String? nationality;
  final String? passportNumber;
  final dynamic forOwn;
  final String? planType;
  final dynamic travelInsurancePackageId;
  final dynamic period;
  final DateTime? start;
  final DateTime? end;
  final dynamic adultsNumber;
  final dynamic childNumber;
  final String? destination;
  final String? purpose;
  final dynamic premium;
  final dynamic totalPremium;
  final String? description;
  final dynamic document;
  final dynamic passportDocument;
  final dynamic documentApprove;
  final dynamic passportDocumentApprove;
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
  final dynamic imagePath;
  final dynamic documentPath;
  final dynamic passportDocumentPath;
  final List<dynamic>? images;
  final List<Family>? family;
  final List<UserPayment>? userPayment;
  final TravelInsurancePackage? travelInsurancePackage;
  TravelInsuranceDetailsData({
    this.id,
    this.name,
    this.middleName,
    this.lastName,
    this.slug,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.phoneCode,
    this.nationality,
    this.passportNumber,
    this.forOwn,
    this.planType,
    this.travelInsurancePackageId,
    this.period,
    this.start,
    this.end,
    this.adultsNumber,
    this.childNumber,
    this.destination,
    this.purpose,
    this.premium,
    this.totalPremium,
    this.description,
    this.document,
    this.passportDocument,
    this.documentApprove,
    this.passportDocumentApprove,
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
    this.passportDocumentPath,
    this.images,
    this.family,
    this.userPayment,
    this.travelInsurancePackage,
  });

  factory TravelInsuranceDetailsData.fromJson(String str) =>
      TravelInsuranceDetailsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelInsuranceDetailsData.fromMap(Map<String, dynamic> json) =>
      TravelInsuranceDetailsData(
        id: json["id"],
        name: json["name"] ?? '',
        middleName: json["middle_name"] ?? '',
        lastName: json["last_name"] ?? '',
        slug: json["slug"] ?? '',
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        phoneCode: json["phone_code"] ?? '',
        nationality: json["nationality"] ?? '',
        passportNumber: json["passport_number"] ?? '',
        forOwn: json["for_own"],
        planType: json["plan_type"] ?? '',
        travelInsurancePackageId: json["travel_insurance_package_id"] ?? '',
        period: json["period"] ?? 0,
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        adultsNumber: json["adults_number"] ?? 0,
        childNumber: json["child_number"] ?? 0,
        destination: json["destination"] ?? '',
        purpose: json["purpose"] ?? '',
        premium: json["premium"] ?? 0,
        totalPremium: json["total_premium"] ?? 0,
        description: json["description"] ?? '',
        document: json["document"] ?? '',
        passportDocument: json["passport_document"] ?? '',
        documentApprove: json["document_approve"] ?? 0,
        passportDocumentApprove: json["passport_document_approve"] ?? 0,
        image: json["image"] ?? '',
        paymentMethodId: json["payment_method_id"] ?? 0,
        discountCode: json["discount_code"] ?? '',
        note: json["note"] ?? '',
        comment: json["comment"] ?? '',
        isPaid: json["is_paid"] ?? 0,
        isEditable: json["is_editable"] ?? 0,
        status: json["status"] ?? 0,
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
        passportDocumentPath: json["passport_document_path"],
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
        travelInsurancePackage: json["travel_insurance_package"] == null
            ? null
            : TravelInsurancePackage.fromJson(json["travel_insurance_package"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "dob": dob?.toIso8601String(),
        "gender": gender,
        "email": email,
        "phone": phone,
        "phone_code": phoneCode,
        "nationality": nationality,
        "passport_number": passportNumber,
        "for_own": forOwn,
        "plan_type": planType,
        "travel_insurance_package_id": travelInsurancePackageId,
        "period": period,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "adults_number": adultsNumber,
        "child_number": childNumber,
        "destination": destination,
        "purpose": purpose,
        "premium": premium,
        "total_premium": totalPremium,
        "description": description,
        "document": document,
        "passport_document": passportDocument,
        "document_approve": documentApprove,
        "passport_document_approve": passportDocumentApprove,
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
        "passport_document_path": passportDocumentPath,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "family": family == null
            ? []
            : List<dynamic>.from(family!.map((x) => x.toMap())),
        "travel_insurance_package": travelInsurancePackage?.toJson(),
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
  final String? nationality;
  final String? passportNumber;
  final dynamic premium;
  final dynamic travelInsuranceFormId;
  final dynamic travelInsurancePackageId;
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
    this.nationality,
    this.passportNumber,
    this.premium,
    this.travelInsuranceFormId,
    this.travelInsurancePackageId,
    this.createdAt,
    this.updatedAt,
  });

  factory Family.fromJson(String str) => Family.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Family.fromMap(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"] ?? '',
        slug: json["slug"] ?? '',
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        relation: json["relation"] ?? '',
        nationality: json["nationality"] ?? '',
        passportNumber: json["passport_number"] ?? '',
        premium: json["premium"] ?? 0,
        travelInsuranceFormId: json["travel_insurance_form_id"] ?? 0,
        travelInsurancePackageId: json["travel_insurance_package_id"] ?? 0,
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
        "nationality": nationality,
        "passport_number": passportNumber,
        "premium": premium,
        "travel_insurance_form_id": travelInsuranceFormId,
        "travel_insurance_package_id": travelInsurancePackageId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class TravelInsurancePackage {
  final int? id;
  final String? slug;
  final String? category;
  final String? plan;
  final int? ageFrom;
  final int? ageTo;
  final int? periodFrom;
  final int? periodTo;
  final int? price;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TravelInsurancePackage({
    this.id,
    this.slug,
    this.category,
    this.plan,
    this.ageFrom,
    this.ageTo,
    this.periodFrom,
    this.periodTo,
    this.price,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory TravelInsurancePackage.fromRawJson(String str) =>
      TravelInsurancePackage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelInsurancePackage.fromJson(Map<String, dynamic> json) =>
      TravelInsurancePackage(
        id: json["id"],
        slug: json["slug"] ?? '',
        category: json["category"] ?? '',
        plan: json["plan"] ?? '',
        ageFrom: json["age_from"] ?? 0,
        ageTo: json["age_to"] ?? 0,
        periodFrom: json["period_from"] ?? 0,
        periodTo: json["period_to"] ?? 0,
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
        "slug": slug,
        "category": category,
        "plan": plan,
        "age_from": ageFrom,
        "age_to": ageTo,
        "period_from": periodFrom,
        "period_to": periodTo,
        "price": price,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
