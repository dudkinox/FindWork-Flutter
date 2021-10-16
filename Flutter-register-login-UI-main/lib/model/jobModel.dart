import 'dart:convert';

JobDataModel jobDataModelFromJson(String str) => JobDataModel.fromJson(json.decode(str));

String jobDataModelToJson(JobDataModel data) => json.encode(data.toJson());

class JobDataModel {
    JobDataModel({
        this.id,
        this.company,
        this.departmentId,
        this.district,
        this.image,
        this.jobId,
        this.province,
        this.subDistrict,
    });

    String id;
    String company;
    DepartmentId departmentId;
    String district;
    String image;
    String jobId;
    String province;
    String subDistrict;

    factory JobDataModel.fromJson(Map<String, dynamic> json) => JobDataModel(
        id: json["id"],
        company: json["company"],
        departmentId: DepartmentId.fromJson(json["department_id"]),
        district: json["district"],
        image: json["image"],
        jobId: json["job_id"],
        province: json["province"],
        subDistrict: json["sub_district"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "department_id": departmentId.toJson(),
        "district": district,
        "image": image,
        "job_id": jobId,
        "province": province,
        "sub_district": subDistrict,
    };
}

class DepartmentId {
    DepartmentId({
        this.salary,
        this.status,
        this.detail,
        this.name,
        this.type,
        this.partTime,
        this.jobTime,
    });

    List<String> salary;
    bool status;
    List<String> detail;
    List<String> name;
    List<String> type;
    List<String> partTime;
    List<String> jobTime;

    factory DepartmentId.fromJson(Map<String, dynamic> json) => DepartmentId(
        salary: List<String>.from(json["salary"].map((x) => x)),
        status: json["status"],
        detail: List<String>.from(json["detail"].map((x) => x)),
        name: List<String>.from(json["name"].map((x) => x)),
        type: List<String>.from(json["type"].map((x) => x)),
        partTime: List<String>.from(json["part_time"].map((x) => x)),
        jobTime: List<String>.from(json["job_time"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "salary": List<dynamic>.from(salary.map((x) => x)),
        "status": status,
        "detail": List<dynamic>.from(detail.map((x) => x)),
        "name": List<dynamic>.from(name.map((x) => x)),
        "type": List<dynamic>.from(type.map((x) => x)),
        "part_time": List<dynamic>.from(partTime.map((x) => x)),
        "job_time": List<dynamic>.from(jobTime.map((x) => x)),
    };
}