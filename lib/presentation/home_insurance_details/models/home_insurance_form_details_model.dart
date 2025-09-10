import 'dart:convert';

class HomeInsuranceFromDetailsModel {
  final bool? success;
  final String? message;
  final HomeInsuranceDetailsData? data;

  HomeInsuranceFromDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory HomeInsuranceFromDetailsModel.fromJson(String str) =>
      HomeInsuranceFromDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeInsuranceFromDetailsModel.fromMap(Map<String, dynamic> json) =>
      HomeInsuranceFromDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : HomeInsuranceDetailsData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class HomeInsuranceDetailsData {
  final dynamic id;
  final String? name;
  final String? slug;
  final DateTime? dob;
  final String? gender;
  final String? email;
  final String? phone;
  final dynamic forOwn;
  final dynamic province;
  final String? homeType;
  final String? propertyType;
  final String? propertyHouse;
  final dynamic propertyBlock;
  final dynamic propertyAlley;
  final dynamic propertyArea;
  final String? propertyFloor;
  final dynamic propertyApartment;
  final dynamic propertyProject;
  final String? propertyStreet;
  final String? propertyAddress;
  final dynamic constructionValue;
  final dynamic contentValue;
  final dynamic liabilityCoverage;
  final dynamic contentCoverage;
  final DateTime? start;
  final DateTime? end;
  final double? rate;
  final dynamic minimumPremium;
  final dynamic totalPremium;
  final dynamic personalLiabilityCoverage;
  final dynamic fireTheftLiabilityCoverage;
  final String? description;
  final dynamic propertyOwnerDocument;
  final dynamic inventoryListDocument;
  final dynamic propertyOwnerDocumentApprove;
  final String? inventoryListDocumentApprove;
  final String? image;
  final dynamic paymentMethodId;
  final String? discountCode;
  final dynamic discountAmount;
  final dynamic isInstallment;
  final dynamic installmentMonth;
  final String? note;
  final dynamic comment;
  final dynamic isPaid;
  final dynamic isEditable;
  final dynamic status;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;
  final String? propertyOwnerDocumentPath;
  final String? inventoryListDocumentPath;
  final List<dynamic>? images;
  final List<UserPayment>? userPayment;

  HomeInsuranceDetailsData({
    this.id,
    this.name,
    this.slug,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.forOwn,
    this.province,
    this.homeType,
    this.propertyType,
    this.propertyHouse,
    this.propertyBlock,
    this.propertyAlley,
    this.propertyArea,
    this.propertyFloor,
    this.propertyApartment,
    this.propertyProject,
    this.propertyStreet,
    this.propertyAddress,
    this.constructionValue,
    this.contentValue,
    this.liabilityCoverage,
    this.contentCoverage,
    this.start,
    this.end,
    this.rate,
    this.minimumPremium,
    this.totalPremium,
    this.personalLiabilityCoverage,
    this.fireTheftLiabilityCoverage,
    this.description,
    this.propertyOwnerDocument,
    this.inventoryListDocument,
    this.propertyOwnerDocumentApprove,
    this.inventoryListDocumentApprove,
    this.image,
    this.paymentMethodId,
    this.discountCode,
    this.discountAmount,
    this.isInstallment,
    this.installmentMonth,
    this.note,
    this.comment,
    this.isPaid,
    this.isEditable,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.propertyOwnerDocumentPath,
    this.inventoryListDocumentPath,
    this.images,
    this.userPayment,
  });

  factory HomeInsuranceDetailsData.fromJson(String str) =>
      HomeInsuranceDetailsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeInsuranceDetailsData.fromMap(Map<String, dynamic> json) =>
      HomeInsuranceDetailsData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"] ?? '',
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        forOwn: json["for_own"],
        province: json["province"] ?? '',
        homeType: json["home_type"] ?? '',
        propertyType: json["property_type"] ?? '',
        propertyHouse: json["property_house"] ?? '',
        propertyBlock: json["property_block"] ?? '',
        propertyAlley: json["property_alley"] ?? '',
        propertyArea: json["property_area"] ?? '',
        propertyFloor: json["property_floor"] ?? '',
        propertyApartment: json["property_apartment"] ?? '',
        propertyProject: json["property_project"] ?? '',
        propertyStreet: json["property_street"] ?? '',
        propertyAddress: json["property_address"] ?? '',
        constructionValue: json["construction_value"] ?? 0,
        contentValue: json["content_value"] ?? 0,
        liabilityCoverage: json["liability_coverage"] ?? 0,
        contentCoverage: json["content_coverage"] ?? 0,
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        rate: json["rate"]?.toDouble(),
        minimumPremium: json["minimum_premium"] ?? 0,
        totalPremium: json["total_premium"] ?? 0,
        personalLiabilityCoverage: json["personal_liability_coverage"] ?? 0,
        fireTheftLiabilityCoverage: json["fire_theft_liability_coverage"] ?? 0,
        description: json["description"] ?? '',
        propertyOwnerDocument: json["property_owner_document"] ?? '',
        inventoryListDocument: json["inventory_list_document"] ?? '',
        propertyOwnerDocumentApprove:
            json["property_owner_document_approve"] ?? '',
        inventoryListDocumentApprove:
            json["inventory_list_document_approve"] ?? '',
        image: json["image"] ?? '',
        paymentMethodId: json["payment_method_id"] ?? 0,
        discountCode: json["discount_code"] ?? '',
        discountAmount: json["discount_amount"] ?? 0,
        isInstallment: json["is_installment"] ?? 0,
        installmentMonth: json["installment_month"] ?? 0,
        note: json["note"] ?? '',
        comment: json["comment"] ?? '',
        isPaid: json["is_paid"] ?? 0,
        isEditable: json["is_editable"] ?? 0,
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
        propertyOwnerDocumentPath: json["property_owner_document_path"],
        inventoryListDocumentPath: json["inventory_list_document_path"],
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
        "province": province,
        "home_type": homeType,
        "property_type": propertyType,
        "property_house": propertyHouse,
        "property_block": propertyBlock,
        "property_alley": propertyAlley,
        "property_area": propertyArea,
        "property_floor": propertyFloor,
        "property_apartment": propertyApartment,
        "property_project": propertyProject,
        "property_street": propertyStreet,
        "property_address": propertyAddress,
        "construction_value": constructionValue,
        "content_value": contentValue,
        "liability_coverage": liabilityCoverage,
        "content_coverage": contentCoverage,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "rate": rate,
        "minimum_premium": minimumPremium,
        "total_premium": totalPremium,
        "personal_liability_coverage": personalLiabilityCoverage,
        "fire_theft_liability_coverage": fireTheftLiabilityCoverage,
        "description": description,
        "property_owner_document": propertyOwnerDocument,
        "inventory_list_document": inventoryListDocument,
        "property_owner_document_approve": propertyOwnerDocumentApprove,
        "inventory_list_document_approve": inventoryListDocumentApprove,
        "image": image,
        "payment_method_id": paymentMethodId,
        "discount_code": discountCode,
        "discount_amount": discountAmount,
        "is_installment": isInstallment,
        "installment_month": installmentMonth,
        "note": note,
        "comment": comment,
        "is_paid": isPaid,
        "is_editable": isEditable,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
        "property_owner_document_path": propertyOwnerDocumentPath,
        "inventory_list_document_path": inventoryListDocumentPath,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "user_payment": userPayment == null
            ? []
            : List<dynamic>.from(userPayment!.map((x) => x.toMap())),
      };
}

class UserPayment {
  final dynamic id;
  final String? name;
  final String? slug;
  final String? invoice;
  final String? description;
  final String? packageType;
  final dynamic homeFormId;
  final dynamic carFormId;
  final dynamic medicalFormId;
  final dynamic travelFormId;
  final dynamic amount;
  final dynamic isPaid;
  final dynamic isInstallment;
  final dynamic paymentMethodId;
  final dynamic paymentMethodDetails;
  final dynamic paymentDate;
  final DateTime? startDate;
  final DateTime? expireDate;
  final dynamic status;
  final dynamic userId;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserPayment({
    this.id,
    this.name,
    this.slug,
    this.invoice,
    this.description,
    this.packageType,
    this.homeFormId,
    this.carFormId,
    this.medicalFormId,
    this.travelFormId,
    this.amount,
    this.isPaid,
    this.isInstallment,
    this.paymentMethodId,
    this.paymentMethodDetails,
    this.paymentDate,
    this.startDate,
    this.expireDate,
    this.status,
    this.userId,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory UserPayment.fromJson(String str) =>
      UserPayment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPayment.fromMap(Map<String, dynamic> json) => UserPayment(
        id: json["id"],
        name: json["name"],
        slug: json["slug"] ?? '',
        invoice: json["invoice"] ?? '',
        description: json["description"] ?? '',
        packageType: json["package_type"] ?? '',
        homeFormId: json["home_form_id"] ?? 0,
        carFormId: json["car_form_id"] ?? 0,
        medicalFormId: json["medical_form_id"] ?? 0,
        travelFormId: json["travel_form_id"] ?? 0,
        amount: json["amount"] ?? 0,
        isPaid: json["is_paid"] ?? 0,
        isInstallment: json["is_installment"] ?? 0,
        paymentMethodId: json["payment_method_id"] ?? 0,
        paymentMethodDetails: json["payment_method_details"] ?? '',
        paymentDate: json["payment_date"] ?? '',
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        status: json["status"] ?? 0,
        userId: json["user_id"] ?? 0,
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
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
        "invoice": invoice,
        "description": description,
        "package_type": packageType,
        "home_form_id": homeFormId,
        "car_form_id": carFormId,
        "medical_form_id": medicalFormId,
        "travel_form_id": travelFormId,
        "amount": amount,
        "is_paid": isPaid,
        "is_installment": isInstallment,
        "payment_method_id": paymentMethodId,
        "payment_method_details": paymentMethodDetails,
        "payment_date": paymentDate,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "user_id": userId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
