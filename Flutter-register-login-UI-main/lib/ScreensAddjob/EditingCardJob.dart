// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';

import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/ScreensAddjob/HomeAddjob.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/alert.dart';
import 'dart:io';

import 'package:login_ui/model/jobModel.dart';

class EditingCardJob extends StatefulWidget {
  EditingCardJob(this.token, this.typeUser, this.name, this.type, this.money,
      this.jobTime, this.id, this.lineID, this.index);
  var token;
  var typeUser;
  var name;
  var type;
  var money;
  var jobTime;
  var lineID;
  var id;
  var index;
  final TextEditingController Title_company = new TextEditingController();
  final TextEditingController Title_type = new TextEditingController();
  final TextEditingController Title_money = new TextEditingController();
  final TextEditingController Title_jobTime = new TextEditingController();
  final TextEditingController Title_lineID = new TextEditingController();
  @override
  MapScreenState createState() => MapScreenState(
      token, typeUser, name, type, money, jobTime, id, lineID, index);
}

class MapScreenState extends State<EditingCardJob>
    with SingleTickerProviderStateMixin {
  MapScreenState(this.token, this.typeUser, this.name, this.type, this.money,
      this.jobTime, this.id, this.lineID, this.index);
  var token;
  var typeUser;
  var name;
  var type;
  var money;
  var jobTime;
  var lineID;
  var id;
  var index;
  var Title_company = new TextEditingController();
  var Title_type = new TextEditingController();
  var Title_money = new TextEditingController();
  var Title_jobTime = new TextEditingController();
  var Title_lineID = new TextEditingController();
  File file;

  var tempName;
  var tempType;
  var tempMoney;
  var tempJobTime;
  var tempLineID;

  var _value;
  var value;

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;


  @override
  Widget build(BuildContext context) {
  print(id);
    if (_status == true) {
      Title_company.text = name;
      Title_type.text = _value;
      Title_money.text = money;
      Title_jobTime.text = jobTime;
      Title_lineID.text = lineID;
      if (type == "parttime") {
        value = "parttime";
        _value = value;
        Title_type.text = _value;
      } else if (type == "fulltime") {
        value = "fulltime";
        _value = value;
        Title_type.text = _value;
      }
    } else {
      Title_company.text = tempName;
      Title_type.text = tempType;
      Title_money.text = tempMoney;
      Title_jobTime.text = tempJobTime;
      Title_lineID.text = tempLineID;
    }

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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeAddjob(
                                    token,
                                    typeUser,
                                  )));
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
                                              'เวลาทำงาน',
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
                                                hintText: "เวลาทำงาน",
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

                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Text(
                                              'Line ID : ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: PrimaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            new Flexible(
                                                child: new TextField(
                                              controller: Title_lineID,
                                              decoration: const InputDecoration(
                                                hintText: "กรอก ID line",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            )),
                                          ],
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("ตำแหน่งงาน"),
                                        Column(children: [
                                          _status
                                              ? Radio(
                                                  value: "salary",
                                                  groupValue: _value,
                                                )
                                              : Radio(
                                                  value: "salary",
                                                  groupValue: _value,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _value = value;
                                                      Title_type.text = _value;
                                                      tempName =
                                                          Title_company.text;
                                                      tempMoney =
                                                          Title_money.text;
                                                      tempJobTime =
                                                          Title_jobTime.text;
                                                      tempType =
                                                          Title_type.text;
                                                      tempLineID =
                                                          Title_lineID.text;
                                                    });
                                                  }),
                                          Text("FullTime"),
                                        ]),
                                        Column(children: [
                                          _status
                                              ? Radio(
                                                  value: "parttime",
                                                  groupValue: _value,
                                                )
                                              : Radio(
                                                  value: "parttime",
                                                  groupValue: _value,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _value = value;
                                                      Title_type.text = _value;
                                                      tempName =
                                                          Title_company.text;
                                                      tempMoney =
                                                          Title_money.text;
                                                      tempJobTime =
                                                          Title_jobTime.text;
                                                      tempType =
                                                          Title_type.text;
                                                      tempLineID =
                                                          Title_lineID.text;
                                                    });
                                                  }),
                                          Text("Partime"),
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
                onPressed: () async {
                  final JobDataModel OldData = await TopicWorkFindID(id);
                  if (Title_type.text == "parttime") {
                    final String status = await UpdateDetailJob(
                        OldData.jobId,
                        OldData,
                        "",
                        Title_company.text,
                        Title_money.text,
                        Title_jobTime.text,
                        Title_type.text,
                        Title_lineID.text,
                        index.toString());
                    if (status == "อัพเดตตำแหน่งงานสำเร็จ") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                      setState(() {
                        name = Title_company.text;
                        type = Title_type.text;
                        money = Title_money.text;
                        jobTime = Title_jobTime.text;
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                  } else if (Title_type.text == "salary") {
                    final String status = await UpdateDetailJob(
                      OldData.jobId,
                      OldData,
                      Title_money.text,
                      Title_company.text,
                      "",
                      Title_jobTime.text,
                      Title_type.text,
                      Title_lineID.text,
                      index.toString(),
                    );
                    if (status == "อัพเดตตำแหน่งงานสำเร็จ") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                      setState(() {
                        name = Title_company.text;
                        type = Title_type.text;
                        money = Title_money.text;
                        jobTime = Title_jobTime.text;
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => AlertMessage(
                            "แจ้งเตือน", "กรุณากรอกเลือกตำแหน่งงาน", null));
                  }
                  setState(() => loading = false);
                  _status = true;
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
                    tempName = name;
                    tempType = _value;
                    tempMoney = money;
                    tempJobTime = jobTime;
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
          // name = tempName;
          // _value = tempType;
          // money = tempMoney;
          // jobTime = tempJobTime;
        });
      },
    );
  }
}
