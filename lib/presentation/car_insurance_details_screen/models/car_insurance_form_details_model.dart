import 'dart:convert';

import '../../home_insurance_details/models/home_insurance_form_details_model.dart';

class CarInsuranceFormDetailsModel {
  final bool? success;
  final String? message;
  final CarInsuranceDetailsData? data;

  CarInsuranceFormDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory CarInsuranceFormDetailsModel.fromJson(String str) =>
      CarInsuranceFormDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarInsuranceFormDetailsModel.fromMap(Map<String, dynamic> json) =>
      CarInsuranceFormDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : CarInsuranceDetailsData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class CarInsuranceDetailsData {
  final dynamic id;
  final String? name;
  final String? slug;
  final DateTime? dob;
  final String? gender;
  final String? email;
  final String? phone;
  final dynamic forOwn;
  final String? carBrand;
  final String? carModel;
  final String? manufactureYear;
  final String? chassisNumber;
  final dynamic carValue;
  final String? plan;
  final dynamic personalAccidentCoverage;
  final dynamic roadsideAssistance;
  final DateTime? start;
  final DateTime? end;
  final dynamic rate;
  final dynamic minimumPremium;
  final dynamic totalPremium;
  final String? description;
  final dynamic carRegistrationDocument;
  final dynamic ownerIdDocument;
  final dynamic carRegistrationDocumentApprove;
  final String? ownerIdDocumentApprove;
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
  final dynamic carRegistrationDocumentPath;
  final dynamic ownerIdDocumentPath;
  final List<dynamic>? images;
  final List<UserPayment>? userPayment;
  CarInsuranceDetailsData({
    this.id,
    this.name,
    this.slug,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.forOwn,
    this.carBrand,
    this.carModel,
    this.manufactureYear,
    this.chassisNumber,
    this.carValue,
    this.plan,
    this.personalAccidentCoverage,
    this.roadsideAssistance,
    this.start,
    this.end,
    this.rate,
    this.minimumPremium,
    this.totalPremium,
    this.description,
    this.carRegistrationDocument,
    this.ownerIdDocument,
    this.carRegistrationDocumentApprove,
    this.ownerIdDocumentApprove,
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
    this.carRegistrationDocumentPath,
    this.ownerIdDocumentPath,
    this.images,
    this.userPayment,
  });

  factory CarInsuranceDetailsData.fromJson(String str) =>
      CarInsuranceDetailsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarInsuranceDetailsData.fromMap(Map<String, dynamic> json) =>
      CarInsuranceDetailsData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        forOwn: json["for_own"],
        carBrand: json["car_brand"],
        carModel: json["car_model"],
        manufactureYear: json["manufacture_year"],
        chassisNumber: json["chassis_number"],
        carValue: json["car_value"],
        plan: json["plan"],
        personalAccidentCoverage: json["personal_accident_coverage"],
        roadsideAssistance: json["roadside_assistance"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        rate: json["rate"],
        minimumPremium: json["minimum_premium"],
        totalPremium: json["total_premium"],
        description: json["description"],
        carRegistrationDocument: json["car_registration_document"],
        ownerIdDocument: json["owner_id_document"],
        carRegistrationDocumentApprove:
            json["car_registration_document_approve"],
        ownerIdDocumentApprove: json["owner_id_document_approve"],
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
        carRegistrationDocumentPath: json["car_registration_document_path"],
        ownerIdDocumentPath: json["owner_id_document_path"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        userPayment: json["user_payment"] == null
            ? []
            : List<UserPayment>.from(
                json["user_payment"]!.map((x) => UserPayment.fromMap(x))),
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
        "car_brand": carBrand,
        "car_model": carModel,
        "manufacture_year": manufactureYear,
        "chassis_number": chassisNumber,
        "car_value": carValue,
        "plan": plan,
        "personal_accident_coverage": personalAccidentCoverage,
        "roadside_assistance": roadsideAssistance,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "rate": rate,
        "minimum_premium": minimumPremium,
        "total_premium": totalPremium,
        "description": description,
        "car_registration_document": carRegistrationDocument,
        "owner_id_document": ownerIdDocument,
        "car_registration_document_approve": carRegistrationDocumentApprove,
        "owner_id_document_approve": ownerIdDocumentApprove,
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
        "car_registration_document_path": carRegistrationDocumentPath,
        "owner_id_document_path": ownerIdDocumentPath,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
