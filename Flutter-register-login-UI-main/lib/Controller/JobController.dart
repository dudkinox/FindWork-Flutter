// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/jobModel.dart';

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

Future<List<String>> Image_location() async {
  final String url = Host + "/api/employer/";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var result = json.decode(response.body);
  print("data " + response.body);
  return result.map<JobDataModel>((json) => JobDataModel.fromJson(json))
          .toList();
}