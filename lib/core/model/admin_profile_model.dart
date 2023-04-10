// To parse this JSON data, do
//
//     final adminProfileModel = adminProfileModelFromJson(jsonString);

import 'dart:convert';

AdminProfileModel adminProfileModelFromJson(String str) => AdminProfileModel.fromJson(json.decode(str));


class AdminProfileModel {
    AdminProfileModel({
        this.status,
        this.message,
        this.data,
    });

    int? status;
    String? message;
    Data ?data;

    factory AdminProfileModel.fromJson(Map<String, dynamic> json) => AdminProfileModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

  
}

class Data {
    Data({
        this.id,
        this.firstName,
        this.otherName,
        this.lastName,
        this.email,
        this.phone,
        this.staffId,
        this.phoneNumber,
        this.nin,
        this.profilePicture,
        this.organizationName,
        this.organizationId,
        this.owner,
    });

    int? id;
    String? firstName;
    String? otherName;
    String? lastName;
    String? email;
    String? phone;
    String? staffId;
    String? phoneNumber;
    String? nin;
    String? profilePicture;
    String? organizationName;
    String? organizationId;
    int? owner;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        otherName: json["otherName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        staffId: json["staffId"],
        phoneNumber: json["phoneNumber"],
        nin: json["nin"],
        profilePicture: json["profilePicture"],
        organizationName: json["organizationName"],
        organizationId: json["organizationId"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "otherName": otherName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "staffId": staffId,
        "phoneNumber": phoneNumber,
        "nin": nin,
        "profilePicture": profilePicture,
        "organizationName": organizationName,
        "organizationId": organizationId,
        "owner": owner,
    };
}
