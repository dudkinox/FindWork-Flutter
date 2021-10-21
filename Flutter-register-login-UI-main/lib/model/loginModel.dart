// To parse this JSON data, do
//
//     final sorener = sorenerFromJson(jsonString);

import 'dart:convert';

AccountModel sorenerFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String sorenerToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    this.email,
    this.matching,
    this.tel,
    this.password,
    this.jobId,
    this.type,
    this.fullname,
    this.username,
    this.image,
  });

  String email;
  String matching;
  String tel;
  String password;
  String jobId;
  String type;
  String fullname;
  String username;
  String image;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        email: json["email"] == null ? null : json["email"],
        matching: json["matching"] == null ? null : json["matching"],
        tel: json["tel"] == null ? null : json["tel"],
        password: json["password"] == null ? null : json["password"],
        jobId: json["job_id"] == null ? null : json["job_id"],
        type: json["type"] == null ? null : json["type"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        username: json["username"] == null ? null : json["username"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "matching": matching == null ? null : matching,
        "tel": tel == null ? null : tel,
        "password": password == null ? null : password,
        "job_id": jobId == null ? null : jobId,
        "type": type == null ? null : type,
        "fullname": fullname == null ? null : fullname,
        "username": username == null ? null : username,
        "image": image == null ? null : image,
      };
}

class RegisterInputModel {
  String username;
  String password;
  String confirmpassword;
  String email;
  String tel;

  RegisterInputModel({
    this.username,
    this.password,
    this.confirmpassword,
    this.email,
    this.tel,
  });
}

class LoginModel {
  String type;
  String id;
  LoginModel({this.type, this.id});
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        type: json["type"] == null ? null : json["type"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "id": id == null ? null : id,
      };
}

class ResumeModel {
  String link;
  ResumeModel({this.link});
  factory ResumeModel.fromJson(Map<String, dynamic> json) => ResumeModel(
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link == null ? null : link,
      };
}
