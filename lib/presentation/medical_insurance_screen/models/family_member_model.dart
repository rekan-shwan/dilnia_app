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
  dynamic premium;
  dynamic medicalCondition;
  int? medicalInsuranceFormId;
  int? medicalInsurancePackageId;
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
    this.medicalCondition,
    this.medicalInsuranceFormId,
    this.medicalInsurancePackageId,
    this.createdAt,
    this.updatedAt,
  });
}
