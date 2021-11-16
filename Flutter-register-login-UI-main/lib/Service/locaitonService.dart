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
    return jsonResponse
        .map((data) => new LocationJobModel.fromJson(data))
        .toList();
  } catch (e) {
    print(e);
  }
}

Future<String> InsertLocation(
  String token,
  double latitude,
  double longitude,
) async {
  try {
    final String Url = Host + "/api/location/" + token;
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"latitude": latitude, "longitude": longitude}),
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

Future<String> UpdateLocation(
    String token, double latitude, double longitude) async {
  try {
    final String Url = Host + "/api/location/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"latitude": latitude, "longitude": longitude}),
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

Future<String> DeleteLocation(
  String token,
) async {
  try {
    final String Url = Host + "/api/location/" + token;
    final response =
        await http.delete(Uri.parse(Url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

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

Future<dynamic> FindIDLocation(String token) async {
  try {
    final String Url = Host + "/api/location/" + token;
    final response = await http.get(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.body == "หาไม่เจอ"){
      return response.body;
    }
    return PositionModel.fromJson(jsonDecode(response?.body));
  } catch (e) {
    print(e);
  }
}
