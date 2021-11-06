// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:login_ui/Database/Host.dart';
import 'package:login_ui/model/loginModel.dart';

Future<List<AccountModel>> DataUser() async {
  final String url = Host + "/api/login";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new AccountModel.fromJson(data)).toList();
}

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
        "password": password,
        "image": ""
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

Future<String> RegisterEmployer(
  String email,
  String fullname,
  String job_id,
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
        "job_id": job_id,
        "matching": "",
        "tel": tel,
        "type": "employer",
        "username": username,
        "password": password,
        "image": ""
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
  try {
    final String url = Host + "/api/login/" + token;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return AccountModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateProfilePassword(
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

Future<String> UpdateProfile(
  String email,
  String fullname,
  String tel,
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

Future<String> UploadResume(String token, File image) async {
  try {
    final String Url = Host + "/api/login/uploadimage/" + token;
    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('img', image.path));
    request.headers.addAll({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    });
    request.send();

    return "อัพโหลดรูปภาพเรียบร้อย";
  } catch (e) {
    print(e);
  }
}

Future<ResumeModel> PreviewResume(String token) async {
  try {
    var searchLink = await FindID(token);
    var image = searchLink?.image;
    if (image != "") {
      final String url = Host + "/api/previewimage/login/" + image;
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return ResumeModel.fromJson(jsonDecode(response?.body));
    } else {
      ResumeModel none = new ResumeModel();
      none?.link = "";
      return none;
    }
  } catch (e) {
    print(e);
  }
}

Future<String> DelLogin(
  String token,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
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