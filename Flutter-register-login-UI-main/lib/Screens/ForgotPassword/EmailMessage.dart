// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Service/EmailService.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';

import 'package:login_ui/components/background.dart';

import 'ForgotPassword.dart';

class EmailMessage extends StatefulWidget {
  EmailMessage(this.token);
  var token;
  final TextEditingController verify = TextEditingController();
  @override
  _EmailMessageState createState() => _EmailMessageState(token);
}

class _EmailMessageState extends State<EmailMessage> {
  _EmailMessageState(this.token);
  var token;
  TextEditingController verify = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  void VerifyCode(String code, String token) async {
    String verify = await VerifyEmail(code);
    if (verify == "true") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ForgotPassword(token)));
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertMessage("แจ้งเตือน", "รหัสยืนยันไม่ถูกต้อง", null),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? LoadingCube()
        : Scaffold(
            body: Background(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "ส่งเลขยืนยันไปยังอีเมลของท่านแล้ว",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF31B4BC),
                          fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          labelText: "กรุณากรอกเลข "),
                      controller: verify,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
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
                            if (verify.text != "")
                              {
                                VerifyCode(verify.text, token),
                              }
                            else
                              {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertMessage(
                                      "แจ้งเตือน", "กรุงณากรอกเลขยืนยัน", null),
                                ),
                              }
                          },
                          child: Text(
                            "ยืนยัน",
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
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: Text(
                        "ย้อนกลับไปเข้าสู่เข้าสู่ระบบ",
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
