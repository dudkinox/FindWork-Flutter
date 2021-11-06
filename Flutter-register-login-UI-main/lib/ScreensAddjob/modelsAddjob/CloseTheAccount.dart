// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';

import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/profile/ProfileController.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/model/loginModel.dart';
import 'dart:io';

import '../HomeAddjob.dart';

class CloseTheAccount extends StatefulWidget {
  CloseTheAccount(this.token, this.typeUser, this.id);
  var token;
  var typeUser;
  var id;
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController tel = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();
  @override
  MapScreenState createState() => MapScreenState(token, typeUser, id);
}

class MapScreenState extends State<CloseTheAccount>
    with SingleTickerProviderStateMixin {
  MapScreenState(this.token, this.typeUser, this.id);
  var token;
  var typeUser;
  var id;
  var fullname = new TextEditingController();
  var email = new TextEditingController();
  var tel = new TextEditingController();
  var password = new TextEditingController();
  var confirmpassword = new TextEditingController();
  File file;

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingCube()
        : WillPopScope(
            onWillPop: onWillPop,
            child: new Scaffold(
                appBar: AppBar(
                  title: Text(
                    "ปิดบัญชีผู้ใช้",
                    style: TextStyle(
                      color: SecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeAddjob(token, typeUser)));
                    },
                  ),
                ),
                body: new Container(
                  color: Colors.white,
                  child: new ListView(
                    children: <Widget>[
                      FadeAnimation(
                        1.0,
                        Column(
                          children: <Widget>[
                            new Container(
                              height: 20.0,
                              color: Colors.white,
                            ),
                            new Container(
                              color: Color(0xffFFFFFF),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 10.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                            ),
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[],
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'ใส่รหัสผ่านเพื่อปิดบัญชีผู้ใช้',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: PrimaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new TextField(
                                                obscureText: true,
                                                controller: password,
                                                decoration: const InputDecoration(
                                                    hintText:
                                                        "ใส่รหัสผ่านเพื่อปิดบัญชีผู้ใช้"),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'ยืนยันรหัสผ่านอีกครั้งเพื่อปิดบัญชี',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: PrimaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new TextField(
                                                obscureText: true,
                                                controller: confirmpassword,
                                                decoration: const InputDecoration(
                                                    hintText:
                                                        "ยืนยันรหัสผ่านอีกครั้งเพื่อปิดบัญชี"),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 120, vertical: 20),
                                      child: RaisedButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0)),
                                        textColor: Colors.white,
                                        padding: const EdgeInsets.all(0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50.0,
                                          // width: size.width * 0.5,
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              gradient:
                                                  new LinearGradient(colors: [
                                                Colors.red,
                                                Colors.red,
                                              ])),
                                          padding: const EdgeInsets.all(0),
                                          child: TextButton(
                                            onPressed: () async {
                                              setState(() {
                                                loading = true;
                                              });
                                              final AccountModel status =
                                                  await FindID(token);
                                              if (password?.text == "") {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) => AlertMessage(
                                                      "แจ้งเตือน",
                                                      "กรุณากรอกรหัสผ่าน",
                                                      null),
                                                );
                                              } else {
                                                if (confirmpassword?.text ==
                                                    "") {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        AlertMessage(
                                                            "แจ้งเตือน",
                                                            "กรุณากรอกรหัสผ่าน",
                                                            null),
                                                  );
                                                } else {
                                                  if (password?.text !=
                                                      confirmpassword?.text) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) => AlertMessage(
                                                          "แจ้งเตือน",
                                                          "กรอกรหัสผ่านไม่ถุูกต้อง",
                                                          null),
                                                    );
                                                  } else {
                                                    if (status?.password ==
                                                        password?.text) {
                                                      final String resultjob =
                                                          await DelJob(id);
                                                      if (resultjob ==
                                                          "ลบสำเร็จ") {
                                                        final String
                                                            resultuser =
                                                            await DelLogin(
                                                                token);
                                                        if (resultuser ==
                                                            "ลบสำเร็จ") {
                                                          showDialog(
                                                            context: context,
                                                            builder: (_) =>
                                                                AlertMessage(
                                                                    "แจ้งเตือน",
                                                                    "ลบบัญชีเสร็จสิ้น",
                                                                    MyApp()),
                                                          );
                                                          print("TEST");
                                                        } else {
                                                          showDialog(
                                                            context: context,
                                                            builder: (_) =>
                                                                AlertMessage(
                                                                    "แจ้งเตือน",
                                                                    "ลบบัญชีปิดปรับปรุงเนื่องจาก server มีปัญหา โปรดลองใหม่ภายหลัง",
                                                                    null),
                                                          );
                                                        }
                                                      } else {
                                                        showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              AlertMessage(
                                                                  "แจ้งเตือน",
                                                                  "ลบบัญชีปิดปรับปรุงเนื่องจาก server มีปัญหา โปรดลองใหม่ภายหลัง",
                                                                  null),
                                                        );
                                                      }
                                                    } else {
                                                      showDialog(
                                                        context: context,
                                                        builder: (_) =>
                                                            AlertMessage(
                                                                "แจ้งเตือน",
                                                                "รหัสผ่านไม่ถูกต้อง",
                                                                null),
                                                      );
                                                    }
                                                  }
                                                }
                                              }
                                              setState(() {
                                                loading = false;
                                              });
                                            },
                                            child: Text(
                                              "ยืนยัน",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
  }
}
