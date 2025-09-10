import 'dart:convert';

class NotificationListModel {
  final bool? success;
  final String? message;
  final NotificationData? data;

  NotificationListModel({
    this.success,
    this.message,
    this.data,
  });

  factory NotificationListModel.fromJson(String str) =>
      NotificationListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationListModel.fromMap(Map<String, dynamic> json) =>
      NotificationListModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : NotificationData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class NotificationData {
  final int? currentPage;
  final List<NotificationItemData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  NotificationData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory NotificationData.fromJson(String str) =>
      NotificationData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationData.fromMap(Map<String, dynamic> json) =>
      NotificationData(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<NotificationItemData>.from(
                json["data"]!.map((x) => NotificationItemData.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class NotificationItemData {
  final int? id;
  final String? name;
  final String? slug;
  final String? nameAr;
  final String? nameKr;
  final String? description;
  final String? descriptionAr;
  final String? descriptionKr;
  final dynamic data;
  final List<dynamic>? user;
  final String? image;
  final int? status;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  NotificationItemData({
    this.id,
    this.name,
    this.slug,
    this.nameAr,
    this.nameKr,
    this.description,
    this.descriptionAr,
    this.descriptionKr,
    this.data,
    this.user,
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

  factory NotificationItemData.fromJson(String str) =>
      NotificationItemData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationItemData.fromMap(Map<String, dynamic> json) =>
      NotificationItemData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        nameAr: json["name_ar"],
        nameKr: json["name_kr"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        descriptionKr: json["description_kr"],
        data: json["data"],
        user: json["user"] == null
            ? []
            : List<dynamic>.from(json["user"]!.map((x) => x)),
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
        "name_ar": nameAr,
        "name_kr": nameKr,
        "description": description,
        "description_ar": descriptionAr,
        "description_kr": descriptionKr,
        "data": data,
        "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x)),
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

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
