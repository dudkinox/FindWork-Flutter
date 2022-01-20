// To parse this JSON data, do
//
//     final depaertmentModel = depaertmentModelFromJson(jsonString);

import 'dart:convert';

DepaertmentModel depaertmentModelFromJson(String str) => DepaertmentModel.fromJson(json.decode(str));

String depaertmentModelToJson(DepaertmentModel data) => json.encode(data.toJson());

class DepaertmentModel {
    DepaertmentModel({
        this.length,
        this.message,
    });

    int length;
    String message;

    factory DepaertmentModel.fromJson(Map<String, dynamic> json) => DepaertmentModel(
        length: json["length"] == null ? null : json["length"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "length": length == null ? null : length,
        "message": message == null ? null : message,
    };
}
