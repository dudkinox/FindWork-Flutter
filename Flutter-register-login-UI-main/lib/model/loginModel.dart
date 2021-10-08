// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        this.email,
        this.fullname,
        this.jobId,
        this.matching,
        this.tel,
        this.type,
        this.username,
        this.password,
    });

    String email;
    String fullname;
    String jobId;
    String matching;
    String tel;
    String type;
    String username;
    String password;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"],
        fullname: json["fullname"],
        jobId: json["job_id"],
        matching: json["matching"],
        tel: json["tel"],
        type: json["type"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "job_id": jobId,
        "matching": matching,
        "tel": tel,
        "type": type,
        "username": username,
        "password": password,
    };
}
