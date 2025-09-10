import 'dart:convert';

class HomeInsuranceFromResponse {
  final bool? success;
  final String? message;
  final HomeInsuranceFromResponseData? data;

  HomeInsuranceFromResponse({
    this.success,
    this.message,
    this.data,
  });

  factory HomeInsuranceFromResponse.fromJson(String str) =>
      HomeInsuranceFromResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeInsuranceFromResponse.fromMap(Map<String, dynamic> json) =>
      HomeInsuranceFromResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : HomeInsuranceFromResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class HomeInsuranceFromResponseData {
  final DataData? data;
  final List<PaymentDatum>? paymentData;

  HomeInsuranceFromResponseData({
    this.data,
    this.paymentData,
  });

  factory HomeInsuranceFromResponseData.fromJson(String str) =>
      HomeInsuranceFromResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeInsuranceFromResponseData.fromMap(Map<String, dynamic> json) =>
      HomeInsuranceFromResponseData(
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
  final String? image;
  final String? propertyType;
  final String? homeType;
  final String? propertyAddress;
  final String? propertyStreet;
  final String? propertyFloor;
  final String? propertyHouse;
  final dynamic propertyBlock;
  final dynamic propertyProject;
  final dynamic propertyAlley;
  final dynamic propertyApartment;
  final String? constructionValue;
  final String? contentValue;
  final String? liabilityCoverage;
  final String? contentCoverage;
  final DateTime? start;
  final DateTime? end;
  final String? totalPremium;
  final String? personalLiabilityCoverage;
  final String? fireTheftLiabilityCoverage;
  final dynamic propertyOwnerDocument;
  final dynamic inventoryListDocument;
  final String? discountCode;
  final String? discountAmount;
  final double? rate;
  final int? minimumPremium;
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
  final String? propertyOwnerDocumentPath;
  final String? inventoryListDocumentPath;

  DataData({
    this.name,
    this.dob,
    this.gender,
    this.phone,
    this.email,
    this.forOwn,
    this.image,
    this.propertyType,
    this.homeType,
    this.propertyAddress,
    this.propertyStreet,
    this.propertyFloor,
    this.propertyHouse,
    this.propertyBlock,
    this.propertyProject,
    this.propertyAlley,
    this.propertyApartment,
    this.constructionValue,
    this.contentValue,
    this.liabilityCoverage,
    this.contentCoverage,
    this.start,
    this.end,
    this.totalPremium,
    this.personalLiabilityCoverage,
    this.fireTheftLiabilityCoverage,
    this.propertyOwnerDocument,
    this.inventoryListDocument,
    this.discountCode,
    this.discountAmount,
    this.rate,
    this.minimumPremium,
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
    this.propertyOwnerDocumentPath,
    this.inventoryListDocumentPath,
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
        propertyType: json["property_type"],
        homeType: json["home_type"],
        propertyAddress: json["property_address"],
        propertyStreet: json["property_street"],
        propertyFloor: json["property_floor"],
        propertyHouse: json["property_house"],
        propertyBlock: json["property_block"],
        propertyProject: json["property_project"],
        propertyAlley: json["property_alley"],
        propertyApartment: json["property_apartment"],
        constructionValue: json["construction_value"],
        contentValue: json["content_value"],
        liabilityCoverage: json["liability_coverage"],
        contentCoverage: json["content_coverage"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        totalPremium: json["total_premium"],
        personalLiabilityCoverage: json["personal_liability_coverage"],
        fireTheftLiabilityCoverage: json["fire_theft_liability_coverage"],
        propertyOwnerDocument: json["property_owner_document"],
        inventoryListDocument: json["inventory_list_document"],
        discountCode: json["discount_code"],
        discountAmount: json["discount_amount"],
        rate: json["rate"]?.toDouble(),
        minimumPremium: json["minimum_premium"],
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
        propertyOwnerDocumentPath: json["property_owner_document_path"],
        inventoryListDocumentPath: json["inventory_list_document_path"],
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
        "property_type": propertyType,
        "home_type": homeType,
        "property_address": propertyAddress,
        "property_street": propertyStreet,
        "property_floor": propertyFloor,
        "property_house": propertyHouse,
        "property_block": propertyBlock,
        "property_project": propertyProject,
        "property_alley": propertyAlley,
        "property_apartment": propertyApartment,
        "construction_value": constructionValue,
        "content_value": contentValue,
        "liability_coverage": liabilityCoverage,
        "content_coverage": contentCoverage,
        "start":
            "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "total_premium": totalPremium,
        "personal_liability_coverage": personalLiabilityCoverage,
        "fire_theft_liability_coverage": fireTheftLiabilityCoverage,
        "property_owner_document": propertyOwnerDocument,
        "inventory_list_document": inventoryListDocument,
        "discount_code": discountCode,
        "discount_amount": discountAmount,
        "rate": rate,
        "minimum_premium": minimumPremium,
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
        "property_owner_document_path": propertyOwnerDocumentPath,
        "inventory_list_document_path": inventoryListDocumentPath,
      };
}

class PaymentDatum {
  final String? name;
  final String? description;
  final String? packageType;
  final int? homeFormId;
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
    this.homeFormId,
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
        homeFormId: json["home_form_id"],
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
        "home_form_id": homeFormId,
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
