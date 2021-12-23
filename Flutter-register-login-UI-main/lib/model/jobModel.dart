// To parse this JSON data, do
//
//     final jobDataModel = jobDataModelFromJson(jsonString);

import 'dart:convert';

JobDataModel jobDataModelFromJson(String str) =>
    JobDataModel.fromJson(json.decode(str));

String jobDataModelToJson(JobDataModel data) => json.encode(data.toJson());

class JobDataModel {
  JobDataModel({
    this.subDistrict,
    this.image,
    this.district,
    this.province,
    this.departmentId,
    this.company,
    this.jobId,
    this.id,
  });

  String subDistrict;
  String image;
  String district;
  String province;
  DepartmentId departmentId;
  String company;
  String jobId;
  String id;

  factory JobDataModel.fromJson(Map<String, dynamic> json) => JobDataModel(
        subDistrict: json["sub_district"] == null ? null : json["sub_district"],
        image: json["image"] == null ? null : json["image"],
        district: json["district"] == null ? null : json["district"],
        province: json["province"] == null ? null : json["province"],
        departmentId: json["department_id"] == null
            ? null
            : DepartmentId.fromJson(json["department_id"]),
        company: json["company"] == null ? null : json["company"],
        jobId: json["job_id"] == null ? null : json["job_id"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "sub_district": subDistrict == null ? null : subDistrict,
        "image": image == null ? null : image,
        "district": district == null ? null : district,
        "province": province == null ? null : province,
        "department_id": departmentId == null ? null : departmentId.toJson(),
        "company": company == null ? null : company,
        "job_id": jobId == null ? null : jobId,
        "id": id == null ? null : id,
      };
}

class DepartmentId {
  DepartmentId({
    this.salary,
    this.detail,
    this.name,
    this.type,
    this.status,
    this.jobTime,
    this.lineID,
    this.partTime,
  });

  List<String> salary;
  List<String> detail;
  List<String> name;
  List<String> type;
  List<bool> status;
  List<String> jobTime;
  List<String> lineID;
  List<String> partTime;

  factory DepartmentId.fromJson(Map<String, dynamic> json) => DepartmentId(
        salary: json["salary"] == null
            ? null
            : List<String>.from(json["salary"].map((x) => x)),
        detail: json["detail"] == null
            ? null
            : List<String>.from(json["detail"].map((x) => x)),
        name: json["name"] == null
            ? null
            : List<String>.from(json["name"].map((x) => x)),
        type: json["type"] == null
            ? null
            : List<String>.from(json["type"].map((x) => x)),
        status: json["status"] == null
            ? null
            : List<bool>.from(json["status"].map((x) => x)),
        jobTime: json["job_time"] == null
            ? null
            : List<String>.from(json["job_time"].map((x) => x)),
        lineID: json["lineID"] == null
            ? null
            : List<String>.from(json["lineID"].map((x) => x)),
        partTime: json["part_time"] == null
            ? null
            : List<String>.from(json["part_time"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "salary":
            salary == null ? null : List<dynamic>.from(salary.map((x) => x)),
        "detail":
            detail == null ? null : List<dynamic>.from(detail.map((x) => x)),
        "name": name == null ? null : List<dynamic>.from(name.map((x) => x)),
        "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
        "status":
            status == null ? null : List<dynamic>.from(status.map((x) => x)),
        "job_time":
            jobTime == null ? null : List<dynamic>.from(jobTime.map((x) => x)),
        "lineID":
            lineID == null ? null : List<dynamic>.from(lineID.map((x) => x)),
        "part_time": partTime == null
            ? null
            : List<dynamic>.from(partTime.map((x) => x)),
      };
}
