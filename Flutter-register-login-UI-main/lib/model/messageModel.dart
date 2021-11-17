
import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
    MessageModel({
        this.image,
        this.message,
        this.company,
    });

    String image;
    String message;
    String company;

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        image: json["image"],
        message: json["message"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "message": message,
        "company": company,
    };
}
