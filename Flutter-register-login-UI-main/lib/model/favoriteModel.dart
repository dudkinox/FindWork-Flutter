import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
    FavoriteModel({
        this.jobId,
        this.idUser,
    });

    List<String> jobId;
    String idUser;

    factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        jobId: List<String>.from(json["job_id"].map((x) => x)),
        idUser: json["id_user"],
    );

    Map<String, dynamic> toJson() => {
        "job_id": List<dynamic>.from(jobId.map((x) => x)),
        "id_user": idUser,
    };
}
