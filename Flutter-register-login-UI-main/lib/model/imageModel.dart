// To parse this JSON data, do
//
//     final imageDepartmentModel = imageDepartmentModelFromJson(jsonString);

import 'dart:convert';

List<ImageDepartmentModel> imageDepartmentModelFromJson(String str) =>
    List<ImageDepartmentModel>.from(
        json.decode(str).map((x) => ImageDepartmentModel.fromJson(x)));

String imageDepartmentModelToJson(List<ImageDepartmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageDepartmentModel {
  ImageDepartmentModel({
    this.image,
  });

  List<String> image;

  factory ImageDepartmentModel.fromJson(Map<String, dynamic> json) =>
      ImageDepartmentModel(
        image: json["image"] == null
            ? null
            : List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : List<dynamic>.from(image.map((x) => x)),
      };
}
