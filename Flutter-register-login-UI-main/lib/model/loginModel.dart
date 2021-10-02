// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'dart:convert';

loginModel sorenerFromJson(String str) => loginModel.fromJson(json.decode(str));

String sorenerToJson(loginModel data) => json.encode(data.toJson());

class loginModel {
  final String ID;
  final String USERNAME;
  final String PASSWORD;
  final String TYPE;
  final String EMAIL;
  final String FULLNAME;
  final String TEL;
  final String MATCHING;
  final String JOB_ID;

  loginModel({
    this.ID,
    this.USERNAME,
    this.PASSWORD,
    this.TYPE,
    this.EMAIL,
    this.FULLNAME,
    this.TEL,
    this.MATCHING,
    this.JOB_ID,
  });

  factory loginModel.fromJson(Map<String, dynamic> json) => loginModel(
        ID: json['id'] == null ? null : json["id"],
        USERNAME: json['username'] == null ? null : json["username"],
        PASSWORD: json['password'] == null ? null : json["password"],
        TYPE: json['type'] == null ? null : json["type"],
        EMAIL: json['email'] == null ? null : json["email"],
        FULLNAME: json['fullname'] == null ? null : json["fullname"],
        TEL: json['tel'] == null ? null : json["tel"],
        MATCHING: json['matching'] == null ? null : json["matching"],
        JOB_ID: json['job_id'] == null ? null : json["job_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": ID == null ? null : ID,
        "username": USERNAME == null ? null : USERNAME,
        "password": PASSWORD == null ? null : PASSWORD,
        "type": TYPE == null ? null : TYPE,
        "email": EMAIL == null ? null : EMAIL,
        "fullname": FULLNAME == null ? null : FULLNAME,
        "tel": TEL == null ? null : TEL,
        "matching": MATCHING == null ? null : MATCHING,
        "job_id": JOB_ID == null ? null : JOB_ID,
      };
}
