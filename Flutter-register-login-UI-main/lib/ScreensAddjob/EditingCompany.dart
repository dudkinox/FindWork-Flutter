// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';

import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:login_ui/model/loginModel.dart';
import 'dart:io';

import 'HomeAddjob.dart';

class EditingCompany extends StatefulWidget {
  EditingCompany(
      this.token,
      this.typeUser,
      this.tokenJob,
      this.company,
      this.detail,
      this.province,
      this.district,
      this.subDistrict,
      this.Job_JobID);
  var tokenJob;
  var token;
  var typeUser;
  var company;
  var detail;
  var province;
  var district;
  var subDistrict;
  var Job_JobID;

  final TextEditingController title_company = new TextEditingController();
  final TextEditingController title_detail = new TextEditingController();
  final TextEditingController title_province = new TextEditingController();
  final TextEditingController title_district = new TextEditingController();
  final TextEditingController title_subDistrict = new TextEditingController();

  final TextEditingController fullname = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController tel = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();
  @override
  MapScreenState createState() => MapScreenState(token, typeUser, tokenJob,
      company, detail, province, district, subDistrict, Job_JobID);
}

class MapScreenState extends State<EditingCompany>
    with SingleTickerProviderStateMixin {
  MapScreenState(
      this.token,
      this.typeUser,
      this.tokenJob,
      this.company,
      this.detail,
      this.province,
      this.district,
      this.subDistrict,
      this.Job_JobID);
  var token;
  var tokenJob;
  var jobID = new AccountModel();
  var typeUser;
  var company;
  var detail;
  var province;
  var district;
  var subDistrict;
  var Job_JobID;

  var fullname = new TextEditingController();
  var email = new TextEditingController();
  var tel = new TextEditingController();
  var password = new TextEditingController();
  var confirmpassword = new TextEditingController();

  var title_company = new TextEditingController();
  var title_detail = new TextEditingController();
  var title_province = new TextEditingController();
  var title_district = new TextEditingController();
  var title_subDistrict = new TextEditingController();

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
    title_company.text = company;
    title_detail.text = detail;
    title_province.text = province;
    title_district.text = district;
    title_subDistrict.text = subDistrict;
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeAddjob(token, typeUser)));
                  },
                ),
              ),
              body: new Container(
                color: NoneColor,
                child: new ListView(
                  children: <Widget>[
                    FadeAnimation(
                        1.0,
                        Column(
                          children: <Widget>[
                            new Container(
                              height: 20.0,
                              color: NoneColor,
                            ),
                            new Container(
                              color: NoneColor,
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
                                                  'ชื่อบริษัท',
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
                                            child: TextField(
                                              controller: title_company,
                                              decoration: const InputDecoration(
                                                hintText: "ใส่ชื่อบริษัทของคุณ",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'ข้อมูลบริษัท',
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
                                              controller: title_detail,
                                              maxLines: 8,
                                              maxLength: 1000,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              decoration: const InputDecoration(
                                                  hintText: "ข้อมูลบริษัท"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'ชื่อจังหวัด',
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
                                            child: TextField(
                                              controller: title_province,
                                              decoration: const InputDecoration(
                                                hintText: "ใส่จังหวัด",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'อำเภอ',
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
                                            child: TextField(
                                              controller: title_district,
                                              decoration: const InputDecoration(
                                                hintText: "ใส่อำเภอ",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                  'ตำบล',
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
                                            child: TextField(
                                              controller: title_subDistrict,
                                              decoration: const InputDecoration(
                                                hintText: "ใส่ตำบล",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                if (snapshot.data?.link == "") {
                                                  return Text(
                                                    "ยังไม่ได้เลือกรูปภาพ",
                                                    textAlign: TextAlign.center,
                                                  );
                                                } else {
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            snapshot.data?.link,
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        color: Colors
                                                            .lightBlueAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.0)),

                                                    // child: Image.network(
                                                    //   snapshot.data?.link,
                                                    //   fit: BoxFit.fill,
                                                    // ),
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
                                                  "เพิ่ม รูปภาพ (image)"),
                                              textColor: Colors.white,
                                              color: PrimaryColor,
                                              onPressed: () async {
                                                var image = await ImagePicker()
                                                    .getImage(
                                                        source: ImageSource
                                                            .gallery);
                                                if (image?.path != null) {
                                                  String status =
                                                      await UploadResume(token,
                                                          File(image.path));

                                                  if (status ==
                                                      "อัพโหลดรูปภาพเรียบร้อย") {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          AlertMessage(
                                                              "แจ้งเตือน",
                                                              "อัพเดตรูปภาพแล้ว",
                                                              EditingCompany(
                                                                  token,
                                                                  typeUser,
                                                                  tokenJob,
                                                                  company,
                                                                  detail,
                                                                  province,
                                                                  district,
                                                                  subDistrict,
                                                                  Job_JobID)),
                                                    );
                                                    setState(() {
                                                      file = File(image.path);
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
                        ))
                  ],
                ),
              ),
            ),
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
                textColor: NoneColor,
                color: ButtonColor,
                onPressed: () async {
                  setState(() => loading = true);
                  if (password.text != "") {
                    if (password.text == confirmpassword.text) {
                      final String status = await UpdateProfilePassword(
                          email.text,
                          fullname.text,
                          tel.text,
                          password.text,
                          token);
                      if (status == "แก้ไขข้อมูลแล้ว") {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                        setState(() {});
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน",
                                "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                                null));
                      }
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "กรอกกรหัสให้ตรงกัน", null));
                    }
                  } else {
                    var request = new JobDataModel(
                      company: title_company.text,
                      district: title_district.text,
                      province: title_province.text,
                      subDistrict: title_subDistrict.text,
                    );

                    var resultDetail = new DepartmentId(detail: [title_detail.text]);
                    
                    
                    final String status = await UpdateJob(
                        tokenJob, request, Job_JobID, resultDetail);
                    if (status == "แก้ไขข้อมูลแล้ว") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                      setState(() {
                        company = request.company;
                        detail = resultDetail.detail[0];
                        district = request.district;
                        province = request.province;
                        subDistrict = request.subDistrict;
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                    setState(() => loading = false);
                    _status = true;
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
                  setState(() {});
                  _status = true;
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
        _status = false;
        setState(() {});
      },
    );
  }
}
