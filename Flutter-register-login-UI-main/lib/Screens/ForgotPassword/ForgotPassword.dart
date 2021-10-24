// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Service/EmailService.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';

import 'package:login_ui/components/background.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword(this.token);
  var token;
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState(token);
}

class _ForgotPasswordState extends State<ForgotPassword> {
  _ForgotPasswordState(this.token);
  var token;
  @override
  void initState() {
    super.initState();
  }

  bool loading = false;
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

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
                      "ขอรหัสผ่านใหม่",
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
                      controller: password,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key_outlined),
                          labelText: "รหัสผ่านใหม่"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: confirmpassword,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key_outlined),
                          labelText: "ยืนยันรหัสผ่านอีกครั้ง"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: RaisedButton(
                      onPressed: () async {
                        if (password.text != "") {
                          if (confirmpassword.text != "") {
                            String status =
                                await ChangePassword(password.text, token);
                            if (status == "แก้ไขข้อมูลแล้ว") {
                              showDialog(
                                context: context,
                                builder: (_) => AlertMessage("แจ้งเตือน",
                                    "เปลี่ยนรหัสเรียบร้อยแล้ว", LoginScreen()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (_) => AlertMessage(
                                    "แจ้งเตือน",
                                    "เซิฟเวอร์เกิดข้อผิดพลาด โปรดลองใหม่ภายหลัง",
                                    null),
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => AlertMessage(
                                  "แจ้งเตือน", "กรุณากรอกยืนยันรหัสผ่าน", null),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน", "กรุณากรอกรหัสผ่าน", null),
                          );
                        }
                      },
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
