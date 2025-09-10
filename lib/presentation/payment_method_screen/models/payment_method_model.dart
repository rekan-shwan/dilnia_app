import 'dart:convert';

class PaymentMethodModel {
  final bool? success;
  final String? message;
  final PaymentData? data;

  PaymentMethodModel({
    this.success,
    this.message,
    this.data,
  });

  factory PaymentMethodModel.fromJson(String str) =>
      PaymentMethodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromMap(Map<String, dynamic> json) =>
      PaymentMethodModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : PaymentData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class PaymentData {
  final int? currentPage;
  final List<PaymentMethodData>? data;
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

  PaymentData({
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

  factory PaymentData.fromJson(String str) =>
      PaymentData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentData.fromMap(Map<String, dynamic> json) => PaymentData(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<PaymentMethodData>.from(
                json["data"]!.map((x) => PaymentMethodData.fromMap(x))),
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

class PaymentMethodData {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final String? api;
  final String? userName;
  final String? password;
  final String? key;
  final String? field;
  final String? image;
  final int? status;
  final int? createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imagePath;

  PaymentMethodData({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.api,
    this.userName,
    this.password,
    this.key,
    this.field,
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

  factory PaymentMethodData.fromJson(String str) =>
      PaymentMethodData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethodData.fromMap(Map<String, dynamic> json) =>
      PaymentMethodData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        api: json["api"],
        userName: json["user_name"],
        password: json["password"],
        key: json["key"],
        field: json["field"],
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
        "api": api,
        "user_name": userName,
        "password": password,
        "key": key,
        "field": field,
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
