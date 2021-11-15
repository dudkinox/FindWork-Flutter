
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/locationJobModel.dart';

Future<List<LocationJobModel>> GetLocationJob(String lat, String long) async {
  try {
    final String url = Host + "/api/location/" + lat + "/" + long;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new LocationJobModel.fromJson(data)).toList();
  } catch (e) {
    print(e);
  }
}
