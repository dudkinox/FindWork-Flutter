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
                                                                              typeUser)));
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
                                                  height: 300.0,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 20.0,
                                                      right: 20.0,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        Text(
                                                          "ข้อมูลบริษัท",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 16,
                                                        ),
                                                        SingleChildScrollView(
                                                          // physics: BouncingScrollPhysics(),
                                                          child: TextFormField(
                                                            maxLines: 8,
                                                            maxLength: 1000,
                                                            keyboardType:
                                                                TextInputType
                                                                    .multiline,
                                                            controller:
                                                                detailCompany,
                                                            decoration:
                                                                new InputDecoration(
                                                              hintText:
                                                                  "ข้อมูลบริษัท",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    width: 5.0),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    width: 5.0),
                                                              ),
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      left: 15,
                                                                      bottom:
                                                                          11,
                                                                      top: 11,
                                                                      right:
                                                                          15),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
}
