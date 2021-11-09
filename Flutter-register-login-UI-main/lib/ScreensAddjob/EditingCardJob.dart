// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';

import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'dart:io';

class EditingCardJob extends StatefulWidget {
  EditingCardJob(this.token, this.typeUser, this.name, this.type, this.money,
      this.jobTime);
  var token;
  var typeUser;
  var name;
  var type;
  var money;
  var jobTime;
  final TextEditingController Title_company = new TextEditingController();
  final TextEditingController Title_type = new TextEditingController();
  final TextEditingController Title_money = new TextEditingController();
  final TextEditingController Title_jobTime = new TextEditingController();
  @override
  MapScreenState createState() =>
      MapScreenState(token, typeUser, name, type, money, jobTime);
}

class MapScreenState extends State<EditingCardJob>
    with SingleTickerProviderStateMixin {
  MapScreenState(this.token, this.typeUser, this.name, this.type, this.money,
      this.jobTime);
  var token;
  var typeUser;
  var name;
  var type;
  var money;
  var jobTime;
  var Title_company = new TextEditingController();
  var Title_type = new TextEditingController();
  var Title_money = new TextEditingController();
  var Title_jobTime = new TextEditingController();
  File file;

  int _value = 0;

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Title_company.text = name;
    Title_type.text = type;
    Title_money.text = money;
    Title_jobTime.text = jobTime;
    return loading
        ? LoadingCube()
        : WillPopScope(
            onWillPop: onWillPop,
            child: new Scaffold(
                appBar: AppBar(
                  title: Text(
                    "แก้ไขรายละเอียดงาน",
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
                      Navigator.pop(context);
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
                                                  'ชื่อตำแหน่งงาน',
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
                                              controller: Title_company,
                                              decoration: const InputDecoration(
                                                hintText:
                                                    "ใส่ชื่อตำแหน่งงานของคุณ",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            )),
                                          ],
                                        )),

                                    // Padding(
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Text(
                                            'Text 1',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 120),
                                            child: new Text(
                                              'Text 2',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: PrimaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          new Flexible(
                                              child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: new TextField(
                                              controller: Title_type,
                                              decoration: const InputDecoration(
                                                hintText: "Text 1",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          )),
                                          new Flexible(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 5),
                                            child: new TextField(
                                              controller: Title_type,
                                              decoration: const InputDecoration(
                                                hintText: "Text 2",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Text(
                                            'Text 3',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 120),
                                            child: new Text(
                                              'Text 4',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: PrimaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          new Flexible(
                                              child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: new TextField(
                                              controller: Title_type,
                                              decoration: const InputDecoration(
                                                hintText: "Text 3",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          )),
                                          new Flexible(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 5),
                                            child: new TextField(
                                              controller: Title_type,
                                              decoration: const InputDecoration(
                                                hintText: "Text 4",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Text(
                                            'เงินเดือน',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 90),
                                            child: new Text(
                                              'วันที่ลงงาน',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: PrimaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          new Flexible(
                                              child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: new TextField(
                                              controller: Title_money,
                                              decoration: const InputDecoration(
                                                hintText: "เงินเดือน",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          )),
                                          new Flexible(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 5),
                                            child: new TextField(
                                              controller: Title_jobTime,
                                              decoration: const InputDecoration(
                                                hintText: "วันที่ลงงาน",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(children: [
                                          Radio(
                                              value: 1,
                                              groupValue: _value,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = value;
                                                });
                                              }),
                                          Text("1"),
                                        ]),
                                        Row(children: [
                                          Radio(
                                              value: 2,
                                              groupValue: _value,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = value;
                                                });
                                              }),
                                          Text("2"),
                                        ]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
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
                // onPressed: () async {
                //   if (password.text != "") {
                //     if (password.text == confirmpassword.text) {
                //       final String status = await UpdateProfilePassword(
                //           email.text,
                //           fullname.text,
                //           tel.text,
                //           password.text,
                //           token);
                //       if (status == "แก้ไขข้อมูลแล้ว") {
                //         showDialog(
                //             context: context,
                //             builder: (_) => AlertMessage(
                //                 "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                //         setState(() {});
                //       } else {
                //         showDialog(
                //             context: context,
                //             builder: (_) => AlertMessage(
                //                 "แจ้งเตือน",
                //                 "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                //                 null));
                //       }
                //       setState(() {
                //         _status = true;
                //         FocusScope.of(context).requestFocus(new FocusNode());
                //       });
                //     } else {
                //       showDialog(
                //           context: context,
                //           builder: (_) => AlertMessage(
                //               "แจ้งเตือน", "กรอกกรหัสให้ตรงกัน", null));
                //     }
                //   } else {
                //     final String status = await UpdateProfile(
                //         email.text, fullname.text, tel.text, token);
                //     if (status == "แก้ไขข้อมูลแล้ว") {
                //       showDialog(
                //           context: context,
                //           builder: (_) => AlertMessage(
                //               "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                //       setState(() {});
                //     } else {
                //       showDialog(
                //           context: context,
                //           builder: (_) => AlertMessage(
                //               "แจ้งเตือน",
                //               "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                //               null));
                //     }
                //     setState(() {
                //       _status = true;
                //       FocusScope.of(context).requestFocus(new FocusNode());
                //     });
                //   }
                // },
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
