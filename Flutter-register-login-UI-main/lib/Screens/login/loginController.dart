import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/ScreensAddjob/HomeAddjob.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/loginModel.dart';
import '../../main.dart';
import '../homehome.dart';

void login(BuildContext context, String username, String password) async {
  LoginModel login = await Login(username, password);
  await FlutterSession().set('token', login.id);
  switch (login.type) {
    case "employee":
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeHome(0,login.id)));
      break;
    case "employer":
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeAddjob(
              "https://brandinside.asia/wp-content/uploads/2016/10/jobsDB-Topcompany12-e1475659499211.jpg")));
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
