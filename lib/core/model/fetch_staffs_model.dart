// To parse this JSON data, do
//
//     final organizationStaffModel = organizationStaffModelFromJson(jsonString);

import 'dart:convert';

List<OrganizationStaffModel> organizationStaffModelFromJson(String str) =>
    List<OrganizationStaffModel>.from(
        json.decode(str)['data'].map((x) => OrganizationStaffModel.fromJson(x)));


String organizationStaffModelToJson(List<OrganizationStaffModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrganizationStaffModel {
  OrganizationStaffModel({
    this.id,
    this.firstName,
    this.otherName,
    this.lastName,
    this.email,
    this.phone,
    this.nin,
    this.profilePicture,
    this.organizationId,
    this.organizationName,
    this.designation,
    this.department,
    this.role,
    this.staffId,
    this.salary,
    this.owner,
  });

  int? id;
  String? firstName;
  String? otherName;
  String? lastName;
  String? email;
  String? phone;
  String? nin;
  String? profilePicture;
  String? organizationId;
  String? organizationName;
  String? designation;
  String? department;
  String? role;
  String? staffId;
  String? salary;
  int? owner;

  factory OrganizationStaffModel.fromJson(Map<String, dynamic> json) =>
      OrganizationStaffModel(
        id: json["id"],
        firstName: json["firstName"],
        otherName: json["otherName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        nin: json["nin"],
        profilePicture: json["profilePicture"],
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        designation: json["designation"],
        department: json["department"],
        role: json["role"],
        staffId: json["staffId"],
        salary: json["salary"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "otherName": otherName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "nin": nin,
        "profilePicture": profilePicture,
        "organizationId": organizationId,
        "organizationName": organizationName,
        "designation": designation,
        "department": department,
        "role": role,
        "staffId": staffId,
        "salary": salary,
        "owner": owner,
      };
}
