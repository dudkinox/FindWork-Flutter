// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
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

Future<List<JobDataModel>> TopicWork() async {
  final String url = Host + "/api/employer";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
}

Future<List<JobDataModel>> Image_location() async {
  final String url = Host + "/api/employer/";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
