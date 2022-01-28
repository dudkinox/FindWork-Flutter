// To parse this JSON data, do
//
//     final imageDepartmentModel = imageDepartmentModelFromJson(jsonString);

import 'dart:convert';

List<String> imageDepartmentModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String imageDepartmentModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
