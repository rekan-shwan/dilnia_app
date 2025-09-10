import 'dart:convert';

class CouponModel {
  final bool? success;
  final String? message;
  final Data? data;

  CouponModel({
    this.success,
    this.message,
    this.data,
  });

  factory CouponModel.fromJson(String str) =>
      CouponModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CouponModel.fromMap(Map<String, dynamic> json) => CouponModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final Coupon? coupon;
  final int? discountAmount;

  Data({
    this.coupon,
    this.discountAmount,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        coupon: json["coupon"] == null ? null : Coupon.fromMap(json["coupon"]),
        discountAmount: json["discount_amount"],
      );

  Map<String, dynamic> toMap() => {
        "coupon": coupon?.toMap(),
        "discount_amount": discountAmount,
      };
}

class Coupon {
  final int? id;
  final String? name;
  final String? slug;
  final String? code;
  final String? insuranceType;
  final List<String>? packageIds;
  final String? discountType;
  final int? discountValue;
  final int? maxDiscountValue;
  final int? minPurchase;
  final int? maxPurchase;
  final String? userType;
  final int? couponLimit;
  final int? couponUsed;
  final DateTime? startDate;
  final DateTime? expireDate;
  final int? status;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Coupon({
    this.id,
    this.name,
    this.slug,
    this.code,
    this.insuranceType,
    this.packageIds,
    this.discountType,
    this.discountValue,
    this.maxDiscountValue,
    this.minPurchase,
    this.maxPurchase,
    this.userType,
    this.couponLimit,
    this.couponUsed,
    this.startDate,
    this.expireDate,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Coupon.fromJson(String str) => Coupon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Coupon.fromMap(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        insuranceType: json["insurance_type"],
        packageIds: json["package_ids"] == null
            ? []
            : List<String>.from(json["package_ids"]!.map((x) => x)),
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        maxDiscountValue: json["max_discount_value"],
        minPurchase: json["min_purchase"],
        maxPurchase: json["max_purchase"],
        userType: json["user_type"],
        couponLimit: json["coupon_limit"],
        couponUsed: json["coupon_used"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
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
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "code": code,
        "insurance_type": insuranceType,
        "package_ids": packageIds == null
            ? []
            : List<dynamic>.from(packageIds!.map((x) => x)),
        "discount_type": discountType,
        "discount_value": discountValue,
        "max_discount_value": maxDiscountValue,
        "min_purchase": minPurchase,
        "max_purchase": maxPurchase,
        "user_type": userType,
        "coupon_limit": couponLimit,
        "coupon_used": couponUsed,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
