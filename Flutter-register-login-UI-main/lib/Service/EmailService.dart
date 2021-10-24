// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';

Future<String> SendEmailForGotPassword(String email) async {
  final String url = Host + "/api/forgot/email/" + email;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  return data;
}

Future<String> VerifyEmail(String verify) async {
  final String url = Host + "/api/forgot/verify/" + verify;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  return data;
}
