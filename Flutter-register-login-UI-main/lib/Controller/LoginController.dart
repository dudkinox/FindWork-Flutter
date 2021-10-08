// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/loginModel.dart';

Future<dynamic> Login(String username, String password) async {
  final String url = Host + "/api/login/" + username + "/" + password;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  return data;
}

Future<RegisterModel> RegisterEmployee(String email, String fullname,
    String tel, String username, String password) async {
  try {
    print("Hello");
    final String Url = Host + "/api/login";

    final response = await http.post(Uri.parse(Url), body: {
      "email": email,
      "fullname": fullname,
      "job_id": "",
      "matching": "",
      "tel": tel,
      "type": "employee",
      "username": username,
      "password": password
    });
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return registerModelFromJson(responseString);
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

Future<dynamic> Del(String username, String password) async {
  final String url = Host + "/api/login/" + username + "/" + password;
  final response = await http.delete(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  return data;
}

Future<dynamic> Find(String username, String password) async {
  final String url = Host + "/api/login/" + username + "/" + password;
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  return data;
}
