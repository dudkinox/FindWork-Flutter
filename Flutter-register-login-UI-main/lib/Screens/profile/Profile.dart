// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/homehome.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/loginModel.dart';
import 'dart:io';

import 'ProfileController.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(this.typeUser, this.token);
  var typeUser;
  var token;
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController tel = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();
  @override
  MapScreenState createState() => MapScreenState(typeUser, token);
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  MapScreenState(this.typeUser, this.token);
  var typeUser;
  var token;
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
                    "ข้อมูลส่วนตัว",
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
                    onPressed: () => {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeHome(0, token, typeUser))),
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
                                              children: <Widget>[
                                                new Text(
                                                  'แก้ไขข้อมูล',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: PrimaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                _status
                                                    ? _getEditIcon()
                                                    : new Container(),
                                              ],
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
                                                  'ชื่อ',
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
                                              child: FutureBuilder<
                                                  TextEditingController>(
                                                future: datafullname(token),
                                                builder: (context, snapshot) {
                                                  fullname = snapshot?.data;
                                                  return new TextField(
                                                    controller: fullname,
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "ใส่ชื่อของคุณ",
                                                    ),
                                                    enabled: !_status,
                                                    autofocus: !_status,
                                                  );
                                                },
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
                                                  'ชื่ออีเมล์',
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
                                                child: FutureBuilder<
                                                        TextEditingController>(
                                                    future: dataemail(token),
                                                    builder:
                                                        (context, snapshot) {
                                                      email = snapshot?.data;
                                                      return new TextField(
                                                        controller: email,
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "ป้อน ID อีเมล"),
                                                        enabled: !_status,
                                                      );
                                                    })),
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
                                                  'เบอร์โทรศัพท์',
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
                                                child: FutureBuilder<
                                                        TextEditingController>(
                                                    future: datatel(token),
                                                    builder:
                                                        (context, snapshot) {
                                                      tel = snapshot.data;
                                                      return new TextField(
                                                        controller: tel,
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "ใส่เบอร์โทรศัพท์"),
                                                        enabled: !_status,
                                                      );
                                                    })),
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
                                                  'ตั้งรหัสผ่านใหม่',
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
                                                decoration:
                                                    const InputDecoration(
                                                        hintText:
                                                            "ตั้งรหัสผ่านใหม่"),
                                                enabled: !_status,
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
                                                  'ยืนยัน ตั้งรหัสผ่านใหม่',
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
                                                        "ยืนยันตั้งรหัสผ่านใหม่"),
                                                enabled: !_status,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Column(
                                        children: [
                                          FutureBuilder<ResumeModel>(
                                            future: PreviewResume(token),
                                            builder: (context, snapshot) {
                                              if (snapshot?.connectionState ==
                                                  ConnectionState.done) {
                                                if (snapshot.data?.link == "") {
                                                  return Text(
                                                    "ยังไม่ได้เลือกรูปภาพ",
                                                    textAlign: TextAlign.center,
                                                  );
                                                } else {
                                                  return Container(
                                                    child: Image?.network(
                                                      snapshot.data?.link,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                return LoadingRipple();
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: RaisedButton(
                                              child: new Text(
                                                  "เพิ่ม Resume (image)"),
                                              textColor: Colors.white,
                                              color: PrimaryColor,
                                              onPressed: () async {
                                                var image = await ImagePicker()
                                                    .getImage(
                                                        source: ImageSource
                                                            ?.gallery);
                                                if (image?.path != null) {
                                                  String status =
                                                      await UploadResume(token,
                                                          File(image?.path));

                                                  if (status ==
                                                      "อัพโหลดรูปภาพเรียบร้อย") {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          AlertMessage(
                                                              "แจ้งเตือน",
                                                              "อัพเดตรูปภาพแล้ว",
                                                              ProfilePage(
                                                                  typeUser,
                                                                  token)),
                                                    );
                                                    setState(() {
                                                      file = File(image?.path);
                                                    });
                                                  } else {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) => AlertMessage(
                                                          "แจ้งเตือน",
                                                          "การอัพโหลดมีปัญหา โปรดลองใหม่ภายหลัง",
                                                          null),
                                                    );
                                                  }
                                                }
                                              },
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          20.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 15.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[],
                                        )),
                                    !_status
                                        ? _getActionButtons()
                                        : new Container(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Color(0xFF25888E),
                onPressed: () async {
                  if (password?.text != "") {
                    if (password?.text == confirmpassword.text) {
                      final String status = await UpdateProfilePassword(
                          email?.text,
                          fullname?.text,
                          tel?.text,
                          password?.text,
                          token);
                      if (status == "แก้ไขข้อมูลแล้ว") {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(typeUser, token)));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน",
                                "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                                null));
                      }
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "กรอกกรหัสให้ตรงกัน", null));
                    }
                  } else {
                    final String status = await UpdateProfile(
                        email.text, fullname.text, tel.text, token);
                    if (status == "แก้ไขข้อมูลแล้ว") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProfilePage(typeUser, token)));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red[600],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: PrimaryColor,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
