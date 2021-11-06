// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/ScreensAddjob/FeaturedCardJob.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/image.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:login_ui/model/loginModel.dart';

import 'EditingCompany.dart';
import 'managerJob/manageControl.dart';
import 'modelsAddjob/CloseTheAccount.dart';

class HomeAddjob extends StatefulWidget {
  HomeAddjob(this.token, this.typeUser);
  TextEditingController detailCompany = new TextEditingController();
  var token;
  var typeUser;

  @override
  _HomeAddjobState createState() => _HomeAddjobState(token, typeUser);
}

class _HomeAddjobState extends State<HomeAddjob> {
  _HomeAddjobState(this.token, this.typeUser);
  var token;
  var typeUser;
  var img;
  bool _status = true;
  TextEditingController detailCompany = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AccountModel>(
      future: FindID(token),
      builder: (context, AsyncSnapshot snapshot) {
        AccountModel datalist = snapshot?.data;
        if (snapshot?.connectionState != ConnectionState.done) {
          return LoadingCube();
        } else {
          return WillPopScope(
              onWillPop: onWillPop,
              child: Material(
                child: FutureBuilder<JobDataModel>(
                    future: TopicWorkFindJob_ID(datalist?.jobId),
                    builder: (context, AsyncSnapshot snapshot) {
                      JobDataModel data = snapshot?.data;
                      if (snapshot?.connectionState != ConnectionState.done) {
                        return LoadingFadingCube();
                      } else {
                        detailCompany.text = data.departmentId.detail[0];
                        return FutureBuilder<ResumeModel>(
                            future: PreviewImageCopany(token),
                            builder: (context, snapshot) {
                              if (snapshot?.connectionState !=
                                  ConnectionState.done) {
                                return LoadingFadingCube();
                              } else {
                                if (snapshot.data?.link == "") {
                                  img = DefaultImage;
                                } else {
                                  img = snapshot.data?.link;
                                }
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FadeAnimation(
                                          1.0,
                                          Container(
                                            height: 350.0,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: PrimaryColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(img),
                                                  fit: BoxFit.cover),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 160.0,
                                                  left: 20.0,
                                                  right: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    child: Container(
                                                      height: 50.0,
                                                      width: 50.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        color: Colors.white
                                                            .withOpacity(.5),
                                                      ),
                                                      child: Transform.rotate(
                                                        angle: 180 * pi / 180,
                                                        child: IconButton(
                                                          iconSize: 30,
                                                          color: Colors.black,
                                                          icon: const Icon(Icons
                                                              .exit_to_app_rounded),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pushReplacement(
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                              return LoginScreen();
                                                            }));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 45.0,
                                                    width: 45.0,
                                                    child: PopupMenuButton(
                                                      itemBuilder: (context) =>
                                                          [
                                                        PopupMenuItem(
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .edit_outlined),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushReplacement(MaterialPageRoute(
                                                                          builder: (context) => EditingCompany(
                                                                              token,
                                                                              typeUser)));
                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                                  child: Text(
                                                                    "แก้ไขรายละเอียดงาน",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .person_outline),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushReplacement(MaterialPageRoute(
                                                                          builder: (context) => CloseTheAccount(
                                                                              token,
                                                                              typeUser,
                                                                              data?.id)));
                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                                  child: Text(
                                                                    "ปิดบัญชี",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                      child: Icon(
                                                        Icons
                                                            .more_vert_outlined,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white
                                                          .withOpacity(.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        FadeAnimation(
                                          1.1,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.company,
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: PrimaryColor),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: PrimaryColor,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      data.province +
                                                          " " +
                                                          data.district +
                                                          " " +
                                                          data.subDistrict,
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 20.0,
                                                      right: 20.0,
                                                    ),
                                                    child: new Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: <Widget>[
                                                        new Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            new Text(
                                                              'ข้อมูลบริษัท',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color:
                                                                      PrimaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        new Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            _status
                                                                ? _getEditIcon()
                                                                : new Container(),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25, right: 25),
                                                  child: SingleChildScrollView(
                                                    child: new Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: <Widget>[
                                                        new Flexible(
                                                          child: new TextField(
                                                            maxLines: 8,
                                                            maxLength: 1000,
                                                            keyboardType:
                                                                TextInputType
                                                                    .multiline,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "ข้อมูลบริษัท"),
                                                            enabled: !_status,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 25.0,
                                                        right: 25.0,
                                                        top: 15.0),
                                                    child: new Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[],
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 25.0,
                                                        right: 25.0,
                                                        top: 2.0),
                                                    child: new Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[],
                                                    )),
                                                !_status
                                                    ? _getActionButtons()
                                                    : new Container(),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "ตำแหน่งงานที่รับสมัคร",
                                                      style: TextStyle(
                                                          color: PrimaryColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15.0),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).pushReplacement(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    HomeAdmin(
                                                                        token,
                                                                        typeUser)));
                                                      },
                                                      child: Text(
                                                        "รายชื่อผู้สมัคร",
                                                        style: TextStyle(
                                                          color: PrimaryColor,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: List.generate(
                                                      demoFeatured.length,
                                                      (HomeAddjob) =>
                                                          FeaturedCardJob(
                                                              featuredJobs:
                                                                  demoFeatured[
                                                                      0],
                                                              token: token,
                                                              typeUser:
                                                                  typeUser,
                                                              id: data.id,
                                                              img: img),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 25),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            });
                      }
                    }),
              ));
        }
      },
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
                onPressed: () {},
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
