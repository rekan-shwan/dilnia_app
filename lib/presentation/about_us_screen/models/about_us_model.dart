import 'dart:convert';

class AboutUsModel {
  final bool? success;
  final String? message;
  final AboutUsData? data;

  AboutUsModel({
    this.success,
    this.message,
    this.data,
  });

  factory AboutUsModel.fromJson(String str) =>
      AboutUsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutUsModel.fromMap(Map<String, dynamic> json) => AboutUsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : AboutUsData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class AboutUsData {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final dynamic nameAr;
  final dynamic nameKr;
  final String? description;
  final dynamic descriptionAr;
  final dynamic descriptionKr;
  final String? email;
  final dynamic email2;
  final String? phone;
  final dynamic phone2;
  final String? website;
  final String? address;
  final dynamic addressAr;
  final dynamic addressKr;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  AboutUsData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.nameAr,
    this.nameKr,
    this.description,
    this.descriptionAr,
    this.descriptionKr,
    this.email,
    this.email2,
    this.phone,
    this.phone2,
    this.website,
    this.address,
    this.addressAr,
    this.addressKr,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  factory AboutUsData.fromJson(String str) =>
      AboutUsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutUsData.fromMap(Map<String, dynamic> json) => AboutUsData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        nameAr: json["name_ar"],
        nameKr: json["name_kr"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        descriptionKr: json["description_kr"],
        email: json["email"],
        email2: json["email2"],
        phone: json["phone"],
        phone2: json["phone2"],
        website: json["website"],
        address: json["address"],
        addressAr: json["address_ar"],
        addressKr: json["address_kr"],
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
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "name_ar": nameAr,
        "name_kr": nameKr,
        "description": description,
        "description_ar": descriptionAr,
        "description_kr": descriptionKr,
        "email": email,
        "email2": email2,
        "phone": phone,
        "phone2": phone2,
        "website": website,
        "address": address,
        "address_ar": addressAr,
        "address_kr": addressKr,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
      };
}
