
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:login_ui/model/loginModel.dart';

Future<List<JobDataModel>> FindMatching(String token) async {
  final String url = Host + "/api/matching/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  List<JobDataModel> temp ;
  if(response?.body != "หาไม่เจอ"){
    return jsonResponse.map((data) => new JobDataModel.fromJson(data)).toList();
  } else {
    return temp;
  }
}
