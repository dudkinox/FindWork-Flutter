// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/components/image.dart';
import 'package:login_ui/model/favoriteModel.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:login_ui/model/loginModel.dart';

import 'LoginService.dart';

Future<JobDataModel> Jobdata() async {
  final String url = Host + "/api/employer/";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return JobDataModel.fromJson(jsonDecode(response.body));
}

Future<List<JobDataModel>> TopicWork() async {
  final String url = Host + "/api/employer";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
}

Future<JobDataModel> TopicWorkFindID(String token) async {
  final String url = Host + "/api/employer/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  JobDataModel temp;
  if (response.body != "หาไม่เจอ") {
    return JobDataModel.fromJson(jsonDecode(response.body));
  } else {
    return temp;
  }
}

Future<String> JobCrate(String job_id, String company) async {
  try {
    final String Url = Host + "/api/employer/";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "company": company,
        "department_id": {
          "salary": [""],
          "name": [""],
          "detail": [""],
          "part_time": [""],
          "job_time": [""],
          "status": [true],
          "type": [""],
          "lineID": [""],
        },
        "district": "",
        "image": "",
        "job_id": job_id,
        "province": "",
        "sub_district": "",
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateJob(String token, JobDataModel request, String Job_JobID,
    DepartmentId detail) async {
  try {
    final JobDataModel OldData = await TopicWorkFindJob_ID(Job_JobID);
    final String Url = Host + "/api/employer/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "company": request.company,
        "department_id": {
          "salary": [OldData.departmentId.salary[0]],
          "detail": [detail.detail[0]],
          "name": [OldData.departmentId.name[0]],
          "part_time": [OldData.departmentId.partTime[0]],
          "job_time": [OldData.departmentId.jobTime[0]],
          "status": [OldData.departmentId.status[0]],
          "type": [OldData.departmentId.type[0]],
          "lineID": [OldData.departmentId.lineID[0]],
        },
        "district": request.district,
        "province": request.province,
        "sub_district": request.subDistrict,
        "image": OldData.image,
        "job_id": OldData.jobId,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateImage(String token, String Job_JobID, String image) async {
  try {
    final JobDataModel OldData = await TopicWorkFindJob_ID(Job_JobID);
    final String Url = Host + "/api/employer/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "company": OldData.company,
        "department_id": {
          "salary": [OldData.departmentId.salary[0]],
          "detail": [OldData.departmentId.detail[0]],
          "name": [OldData.departmentId.name[0]],
          "part_time": [OldData.departmentId.partTime[0]],
          "job_time": [OldData.departmentId.jobTime[0]],
          "status": [OldData.departmentId.status[0]],
          "type": [OldData.departmentId.type[0]],
          "lineID": [OldData.departmentId.lineID[0]],
        },
        "district": OldData.district,
        "province": OldData.province,
        "sub_district": OldData.subDistrict,
        "image": image,
        "job_id": OldData.jobId,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateDetailJob(
  String job_id,
  JobDataModel OldData,
  String salary,
  String name,
  String parttime,
  String jobtime,
  String type,
  String lineID,
  String index,
) async {
  try {
    final String Url =
        Host + "/api/employer/department/" + index + "/" + job_id;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "department_id": {
          "status": [true],
          "salary": [salary],
          "detail": [OldData.departmentId.detail[0]],
          "part_time": [parttime],
          "type": [type],
          "name": [name],
          "lineID": [lineID],
          "job_time": [jobtime]
        }
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<JobDataModel> TopicWorkFindJob_ID(String Job_id) async {
  final String url = Host + "/api/employer/find/" + Job_id;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return JobDataModel.fromJson(jsonDecode(response.body));
}

Future<ResumeModel> PreviewImageCopany(String token) async {
  try {
    var searchLink = await FindID(token);
    var image = searchLink.image;
    if (image != "") {
      final String url = Host + "/api/previewimage/login/" + image;
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return ResumeModel.fromJson(jsonDecode(response.body));
    } else {
      ResumeModel none = new ResumeModel();
      none.link = "";
      return none;
    }
  } catch (e) {
    print(e);
  }
}

Future<String> AddFavorite(
  String job_id,
  String user_id,
) async {
  try {
    final String Url = Host + "/api/favorite/" + job_id + "/" + user_id;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "job_user": user_id,
        "job_id": job_id,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> DelFavorite(
  String job_id,
  String user_id,
) async {
  try {
    final String Url = Host + "/api/favorite/delete/" + job_id + "/" + user_id;
    final response = await http.delete(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "job_user": user_id,
        "job_id": job_id,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> DelAllFavorite(
  String user_id,
) async {
  try {
    final String Url = Host + "/api/favorite/delete_all/" + user_id;
    final response = await http.delete(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> DelJob(
  String token,
) async {
  try {
    final String Url = Host + "/api/employer/delete/" + token;
    final response =
        await http.delete(Uri.parse(Url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> DelJobDetail(
  String job_id,
  String index,
) async {
  try {
    final String Url =
        Host + "/api/employer/delete/department/" + index + "/" + job_id;
    final response =
        await http.delete(Uri.parse(Url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<FavoriteModel> GetFavorite(String token) async {
  try {
    final String url = Host + "/api/favorite/" + token;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return FavoriteModel.fromJson(jsonDecode(response?.body));
  } catch (e) {
    print(e);
  }
}

Future<String> AddDepartment(String token) async {
  try {
    final String Url = Host + "/api/employer/add/department/" + token;
    final response = await http.put(Uri.parse(Url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UploadImageDepartment(
    String index, String job_id, File image) async {
  try {
    final String Url =
        Host + "/api/employer/department/image/" + index + "/" + job_id;
    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('img', image.path));
    request.headers.addAll({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    });
    request.send();

    return "อัพโหลดรูปภาพเรียบร้อย";
  } catch (e) {
    print(e);
  }
}

Future<ResumeModel> PreviewImageDepartment(String image) async {
  try {
    if (image != "") {
      final String url =
          Host + "/api/employer/department/previewimage/" + image;
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return ResumeModel.fromJson(jsonDecode(response?.body));
    } else {
      ResumeModel none = new ResumeModel();
      none?.link = DefaultImage;
      return none;
    }
  } catch (e) {
    print(e);
  }
}

Future<String> GetImageIdDepartment(String token, String index) async {
  try {
    final String Url =
        Host + "/api/employer/department/getimage/" + token + "/" + index;
    final response = await http.get(Uri.parse(Url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}
