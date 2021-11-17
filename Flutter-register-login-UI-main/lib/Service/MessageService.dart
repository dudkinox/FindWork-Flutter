

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/messageModel.dart';

Future<dynamic> GetMessage(String token) async {
  final String url = Host + "/api/msg/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if(response.body == "หาไม่เจอ เส้น /massage/:id_user"){
    return "หาไม่เจอ";
  }
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new MessageModel.fromJson(data)).toList();
}