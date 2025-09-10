class FamilyMemberModel {
  int? id;
  String? name;
  String? slug;
  String? dob;
  String? gender;
  String? email;
  String? phone;
  String? relation;
  String? plan;
  String? nationality;
  String? passportNumber;
  dynamic premium;
  int? travelInsuranceFormId;
  int? travelInsurancePackageId;
  DateTime? createdAt;
  DateTime? updatedAt;

  FamilyMemberModel({
    this.id,
    this.name,
    this.slug,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.relation,
    this.plan,
    this.premium,
    this.travelInsuranceFormId,
    this.travelInsurancePackageId,
    this.nationality,
    this.passportNumber,
    this.createdAt,
    this.updatedAt,
  });
}
