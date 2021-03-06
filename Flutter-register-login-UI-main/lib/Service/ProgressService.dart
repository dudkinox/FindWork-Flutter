// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/ProgressModel.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:http/http.dart' as http;
import 'package:login_ui/model/loginModel.dart';

Future<List<JobDataModel>> Progress(String token) async {
  final String url = Host + "/api/progress/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
}

Future<List<AccountModel>> RegisProgress(String token) async {
  final String url = Host + "/api/progress/recheck/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new AccountModel.fromJson(data)).toList();
}

Future<dynamic> GetProgressID(String token) async {
  final String url = Host + "/api/progress/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.body == "ไม่พบ") {
    return response.body;
  } else {
    return ProgressModel.fromJson(jsonDecode(response.body));
  }
}

Future<String> AddProgress(String token, String job_id) async {
  try {
    final String url = Host + "/api/progress";
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "id_user": token,
        "job_id": [
          {"id": job_id, "status": "รอ"}
        ]
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

Future<String> StatusProgress(
    String token, String status, String position) async {
  try {
    final String url =
        Host + "/api/progress/recheck/" + token + "/" + status + "/" + position;
    final response = await http.put(
      Uri.parse(url),
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
