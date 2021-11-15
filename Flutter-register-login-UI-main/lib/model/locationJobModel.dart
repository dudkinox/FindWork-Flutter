import 'dart:convert';

import 'SearchModel.dart';

List<LocationJobModel> locationJobModelFromJson(String str) =>
    List<LocationJobModel>.from(
        json.decode(str).map((x) => LocationJobModel.fromJson(x)));

String locationJobModelToJson(List<LocationJobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  factory LocationJobModel.fromJson(Map<String, dynamic> json) =>
      LocationJobModel(
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

PositionModel positionModelFromJson(String str) =>
    PositionModel.fromJson(json.decode(str));
String positionModelToJson(PositionModel data) => json.encode(data.toJson());

class PositionModel {
  PositionModel({
    this.jobId,
    this.latitude,
    this.longitude,
  });

  String jobId;
  double latitude;
  double longitude;

  factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
        jobId: json["job_id"] == null ? null : json["job_id"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId == null ? null : jobId,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
      };
}
