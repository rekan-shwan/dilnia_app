import 'dart:convert';

class TicketDetailsModel {
  final bool? success;
  final String? message;
  final Data? data;

  TicketDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory TicketDetailsModel.fromJson(String str) =>
      TicketDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketDetailsModel.fromMap(Map<String, dynamic> json) =>
      TicketDetailsModel(
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
  final int? id;
  final String? title;
  final String? description;
  final String? note;
  final User? user;
  final dynamic solvedBy;
  final List<Reply>? replies;
  final int? status;
  final DateTime? createdAt;

  Data({
    this.id,
    this.title,
    this.description,
    this.note,
    this.user,
    this.solvedBy,
    this.replies,
    this.status,
    this.createdAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        note: json["note"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        solvedBy: json["solved_by"],
        replies: json["replies"] == null
            ? []
            : List<Reply>.from(json["replies"]!.map((x) => Reply.fromMap(x))),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "note": note,
        "user": user?.toMap(),
        "solved_by": solvedBy,
        "replies": replies == null
            ? []
            : List<dynamic>.from(replies!.map((x) => x.toMap())),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Reply {
  final int? id;
  final String? title;
  final String? description;
  final User? user;
  final int? status;
  final DateTime? createdAt;

  Reply({
    this.id,
    this.title,
    this.description,
    this.user,
    this.status,
    this.createdAt,
  });

  factory Reply.fromJson(String str) => Reply.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reply.fromMap(Map<String, dynamic> json) => Reply(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "user": user?.toMap(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic image;
  final int? roleId;
  final int? isAdmin;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.roleId,
    this.isAdmin,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        roleId: json["role_id"],
        isAdmin: json["is_admin"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "role_id": roleId,
        "is_admin": isAdmin,
      };
}
