// ignore_for_file: missing_return, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/jobModel.dart';

Future<List<JobDataModel>> FindMatching(String token) async {
  try {
    final String url = Host + "/api/matching/" + token;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List jsonResponse = json.decode(response?.body);
    return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
  } catch (e) {
    print(e);
  }
}
