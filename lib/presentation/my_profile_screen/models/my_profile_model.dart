/// This class defines the variables used in the [my_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
import 'dart:convert';

class MyProfileModel {
  final bool? success;
  final String? message;
  final UserData? data;

  MyProfileModel({
    this.success,
    this.message,
    this.data,
  });

  factory MyProfileModel.fromJson(String str) =>
      MyProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyProfileModel.fromMap(Map<String, dynamic> json) => MyProfileModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class UserData {
  final int? id;
  final String? name;
  final String? slug;
  final String? email;
  final String? phone;
  final dynamic image;
  final dynamic imagePath;
  final dynamic address;
  final dynamic gender;
  final dynamic dob;
  final dynamic bio;
  final int? status;
  final int? isAdmin;
  final dynamic emailVerifiedAt;
  final dynamic phoneVerifiedAt;
  final int? roleId;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserData({
    this.id,
    this.name,
    this.slug,
    this.email,
    this.phone,
    this.image,
    this.imagePath,
    this.address,
    this.gender,
    this.dob,
    this.bio,
    this.status,
    this.isAdmin,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.roleId,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"] ?? '',
        slug: json["slug"],
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        image: json["image"],
        imagePath: json["image_path"],
        address: json["address"] ?? '',
        gender: json["gender"] ?? '',
        dob: json["dob"] ?? '',
        bio: json["bio"] ?? '',
        status: json["status"],
        isAdmin: json["is_admin"],
        emailVerifiedAt: json["email_verified_at"],
        phoneVerifiedAt: json["phone_verified_at"],
        roleId: json["role_id"],
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

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "email": email,
        "phone": phone,
        "image": image,
        "address": address,
        "gender": gender,
        "dob": dob,
        "bio": bio,
        "status": status,
        "is_admin": isAdmin,
        "email_verified_at": emailVerifiedAt,
        "phone_verified_at": phoneVerifiedAt,
        "role_id": roleId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
