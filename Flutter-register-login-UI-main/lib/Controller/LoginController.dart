// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/loginModel.dart';

Future<loginModel> GetLogin() async {
  final String url = Host + "/api/login";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return sorenerFromJson(response.body);
  } else {
    throw Exception();
  }
}
