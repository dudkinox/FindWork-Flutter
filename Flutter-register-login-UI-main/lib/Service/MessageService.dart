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
  if (response.body == "หาไม่เจอ เส้น /massage/:id_user") {
    return "หาไม่เจอ";
  }
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new MessageModel.fromJson(data)).toList();
}

Future<String> SendApproveMessage(
  String job_id,
  String id_user,
  String msg
) async {
  try {
    final String Url = Host + "/api/msg";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "job_id": [
          {
            "id": job_id,
            "message": msg,
          }
        ],
        "id_user": id_user
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
