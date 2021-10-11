// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/loginModel.dart';

Future<LoginModel> Login(String username, String password) async {
  final String url = Host + "/api/login/" + username + "/" + password;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return LoginModel.fromJson(jsonDecode(response.body));
}

Future<String> RegisterEmployee(
  String email,
  String fullname,
  String tel,
  String username,
  String password,
) async {
  try {
    final String Url = Host + "/api/login";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "fullname": fullname,
        "job_id": "",
        "matching": "",
        "tel": tel,
        "type": "employee",
        "username": username,
        "password": password
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

Future<AccountModel> FindID(String token) async {
  try
  {
    final String url = Host + "/api/login/" + token;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return AccountModel.fromJson(jsonDecode(response.body));
  } 
  catch (e) {
    print(e);
  }
}

Future<String> UpdateProfile(
  String email,
  String fullname,
  String tel,
  String password,
  String token,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "fullname": fullname,
        "tel": tel,
        "password": password
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
