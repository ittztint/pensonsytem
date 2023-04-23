// To parse this JSON data, do
//
//     final staffProfileModel = staffProfileModelFromJson(jsonString);

import 'dart:convert';

StaffProfileModel staffProfileModelFromJson(String str) => StaffProfileModel.fromJson(json.decode(str));

String staffProfileModelToJson(StaffProfileModel data) => json.encode(data.toJson());

class StaffProfileModel {
    StaffProfileModel({
        this.status,
        this.message,
        this.data,
    });

    int? status;
    String? message;
    Data? data;

    factory StaffProfileModel.fromJson(Map<String, dynamic> json) => StaffProfileModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
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
        this.isActive,
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
    bool? isActive;
    int? owner;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        isActive: json["isActive"],
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
        "isActive": isActive,
        "owner": owner,
    };
}
