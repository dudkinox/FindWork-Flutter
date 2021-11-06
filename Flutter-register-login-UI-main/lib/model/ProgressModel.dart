import 'dart:convert';

ProgressModel progressModelFromJson(String str) => ProgressModel.fromJson(json.decode(str));

String progressModelToJson(ProgressModel data) => json.encode(data.toJson());

class ProgressModel {
    ProgressModel({
        this.idUser,
        this.jobId,
    });

    String idUser;
    List<JobId> jobId;

    factory ProgressModel.fromJson(Map<String, dynamic> json) => ProgressModel(
        idUser: json["id_user"],
        jobId: List<JobId>.from(json["job_id"].map((x) => JobId.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "job_id": List<dynamic>.from(jobId.map((x) => x.toJson())),
    };
}

class JobId {
    JobId({
        this.status,
        this.id,
    });

    String status;
    String id;

    factory JobId.fromJson(Map<String, dynamic> json) => JobId(
        status: json["status"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
    };
}
