// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
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
  print(jsonResponse);
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
