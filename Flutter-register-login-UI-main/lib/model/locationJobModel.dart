import 'dart:convert';

List<LocationJobModel> locationJobModelFromJson(String str) => List<LocationJobModel>.from(json.decode(str).map((x) => LocationJobModel.fromJson(x)));

String locationJobModelToJson(List<LocationJobModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationJobModel {
    LocationJobModel({
        this.image,
        this.province,
        this.subDistrict,
        this.jobId,
        this.departmentId,
        this.company,
        this.district,
        this.latitude,
        this.longitude,
    });

    String image;
    String province;
    String subDistrict;
    String jobId;
    DepartmentId departmentId;
    String company;
    String district;
    double latitude;
    double longitude;

    factory LocationJobModel.fromJson(Map<String, dynamic> json) => LocationJobModel(
        image: json["image"],
        province: json["province"],
        subDistrict: json["sub_district"],
        jobId: json["job_id"],
        departmentId: DepartmentId.fromJson(json["department_id"]),
        company: json["company"],
        district: json["district"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "province": province,
        "sub_district": subDistrict,
        "job_id": jobId,
        "department_id": departmentId.toJson(),
        "company": company,
        "district": district,
        "latitude": latitude.toDouble(),
        "longitude": longitude.toDouble(),
    };
}

class DepartmentId {
    DepartmentId({
        this.name,
        this.detail,
        this.status,
        this.salary,
        this.jobTime,
        this.type,
        this.partTime,
    });

    List<String> name;
    List<String> detail;
    List<bool> status;
    List<String> salary;
    List<String> jobTime;
    List<String> type;
    List<String> partTime;

    factory DepartmentId.fromJson(Map<String, dynamic> json) => DepartmentId(
        name: List<String>.from(json["name"].map((x) => x)),
        detail: List<String>.from(json["detail"].map((x) => x)),
        status: List<bool>.from(json["status"].map((x) => x)),
        salary: List<String>.from(json["salary"].map((x) => x)),
        jobTime: List<String>.from(json["job_time"].map((x) => x)),
        type: List<String>.from(json["type"].map((x) => x)),
        partTime: List<String>.from(json["part_time"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": List<dynamic>.from(name.map((x) => x)),
        "detail": List<dynamic>.from(detail.map((x) => x)),
        "status": List<dynamic>.from(status.map((x) => x)),
        "salary": List<dynamic>.from(salary.map((x) => x)),
        "job_time": List<dynamic>.from(jobTime.map((x) => x)),
        "type": List<dynamic>.from(type.map((x) => x)),
        "part_time": List<dynamic>.from(partTime.map((x) => x)),
    };
}
