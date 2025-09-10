import 'dart:convert';

class BannerListModel {
  final bool? success;
  final String? message;
  final List<BannerData>? data;

  BannerListModel({
    this.success,
    this.message,
    this.data,
  });

  factory BannerListModel.fromJson(String str) =>
      BannerListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerListModel.fromMap(Map<String, dynamic> json) => BannerListModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BannerData>.from(
                json["data"]!.map((x) => BannerData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BannerData {
  final int? id;
  final String? name;
  final String? nameAr;
  final String? nameKr;
  final String? slug;
  final String? description;
  final String? image;
  final int? status;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  BannerData({
    this.id,
    this.name,
    this.nameAr,
    this.nameKr,
    this.slug,
    this.description,
    this.image,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  factory BannerData.fromJson(String str) =>
      BannerData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerData.fromMap(Map<String, dynamic> json) => BannerData(
        id: json["id"],
        name: json["name"],
        nameAr: json["name_ar"],
        nameKr: json["name_kr"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
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
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_path": imagePath,
      };
}
