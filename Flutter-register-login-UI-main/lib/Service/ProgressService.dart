import 'dart:convert';

import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:http/http.dart' as http;

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
