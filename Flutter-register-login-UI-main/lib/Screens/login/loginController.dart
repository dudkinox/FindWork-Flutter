import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/ScreensAddjob/modelsAddjob/HomeEmployer.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Service/MessageService.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/loginModel.dart';
import '../../main.dart';
import '../homehome.dart';

Future<void> ShowNoti(String token) async {
  var getMessage = await GetMessage(token);
  if (getMessage != "หาไม่เจอ") {
    await FlutterSession().set('notification', 1);
  } else {
    await FlutterSession().set('notification', 0);
  }
}

void login(BuildContext context, String username, String password) async {
  LoginModel login = await Login(username, password);
  AccountModel result = await FindID(login.id);
  await FlutterSession().set('token', login.id);
  switch (login.type) {
    case "employee":
      ShowNoti(login.id);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              HomeHome(0, login.id, login.type, result.matching)));
      break;
    case "employer":
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeEmployer(login.id, login.type)));
      break;
    default:
      showDialog(
        context: context,
        builder: (_) => AlertMessage(
            "แจ้งเตือน", "บัญชีผู้ใช้หรือรหัสผ่านไม่ถูกต้อง", MyApp()),
      );
      break;
  }
}
