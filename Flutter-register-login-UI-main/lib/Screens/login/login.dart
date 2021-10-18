// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/Screens/register/registerAddjob.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/background.dart';
import 'loginController.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading? Loading() : Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "เข้าสู่ระบบ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF31B4BC),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_outlined),
                    labelText: "ชื่อผู้ใช้"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_outlined), labelText: "รหัสผ่าน"),
                obscureText: true,
                controller: password,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "ลืมรหัสผ่าน?",
                style: TextStyle(fontSize: 12, color: PrimaryColor),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color(0xFF25888E),
                        Color(0xFF31B4BC),
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: () => {
                      if (username.text != "")
                        {
                          if (password.text != "")
                            {
                              setState(() => loading = true),
                              login(context, username.text, password.text),
                            }
                          else
                            {
                              showDialog(
                                context: context,
                                builder: (_) => AlertMessage(
                                    "แจ้งเตือน", "กรุงณากรอกรหัสผ่าน", null),
                              ),
                            }
                        }
                      else
                        {
                          showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน", "กรุงณากรอกบัญชีผู้ใช้", null),
                          ),
                        }
                    },
                    child: Text(
                      "เข้าสู่ระบบ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: 2.8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(),
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: Text(
                  "สมัครสมาชิก/สมัครงาน",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterAddjobScreen()))
                },
                child: Text(
                  "สมัครสมาชิก/รับสมัครงาน",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
