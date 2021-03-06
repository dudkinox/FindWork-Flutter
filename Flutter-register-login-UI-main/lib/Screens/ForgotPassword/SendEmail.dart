// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/login/login.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';

import 'package:login_ui/components/background.dart';
import 'package:login_ui/model/loginModel.dart';

import 'ForGotController.dart';

class SendEmail extends StatefulWidget {
  SendEmail({Key key}) : super(key: key);
  final TextEditingController email = TextEditingController();

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final TextEditingController email = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

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
                      "ส่งอีเมล",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF31B4BC),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      // validator: MultiValidator([
                      //   RequiredValidator(errorText: "กรุณากรอกอีเมล"),
                      //   EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                      // ]),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          labelText: "กรุณากรอกอีเมลผู้ใช้"),
                      controller: email,
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
                            if (email.text != "")
                              {
                                SendEmailForGot(context, email.text),
                              }
                            else
                              {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertMessage(
                                      "แจ้งเตือน", "กรุงณากรอกอีเมล", null),
                                ),
                              }
                          },
                          child: Text(
                            "ส่งอีเมล",
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
                        Navigator.pop(context)
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
