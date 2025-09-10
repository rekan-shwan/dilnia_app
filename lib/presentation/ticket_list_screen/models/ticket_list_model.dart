import 'dart:convert';

class TicketListModel {
  final bool? success;
  final String? message;
  final List<TicketData>? data;

  TicketListModel({
    this.success,
    this.message,
    this.data,
  });

  factory TicketListModel.fromJson(String str) =>
      TicketListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketListModel.fromMap(Map<String, dynamic> json) => TicketListModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TicketData>.from(
                json["data"]!.map((x) => TicketData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class TicketData {
  final int? id;
  final String? title;
  final String? description;
  final String? note;
  final User? user;
  final dynamic solvedBy;
  final int? status;
  final DateTime? createdAt;

  TicketData({
    this.id,
    this.title,
    this.description,
    this.note,
    this.user,
    this.solvedBy,
    this.status,
    this.createdAt,
  });

  factory TicketData.fromJson(String str) =>
      TicketData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketData.fromMap(Map<String, dynamic> json) => TicketData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        note: json["note"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        solvedBy: json["solved_by"],
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
