import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
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
  var token;
  var typeUser;

  @override
  _HomeAddjobState createState() => _HomeAddjobState(token, typeUser);
}

class _HomeAddjobState extends State<HomeAddjob> {
  _HomeAddjobState(this.token, this.typeUser);
  var token;
  var typeUser;

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
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadeAnimation(
                                    1.0,
                                    FutureBuilder<ResumeModel>(
                                        future: PreviewImageCopany(token),
                                        builder: (context, snapshot) {
                                          var img;
                                          if (snapshot?.connectionState !=
                                              ConnectionState.done) {
                                            return LoadingFadingCube();
                                          } else {
                                            if (snapshot.data?.link == "") {
                                              //Link รูป Default
                                              img = DefaultImage;
                                            } else {
                                              img = snapshot.data?.link;
                                            }
                                            return Container(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
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
                                                      height: 50.0,
                                                      width: 50.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        color: Colors.white
                                                            .withOpacity(.5),
                                                      ),
                                                      child: PopupMenuButton(
                                                        itemBuilder:
                                                            (context) => [
                                                          PopupMenuItem(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(MaterialPageRoute(
                                                                        builder: (context) => EditingCompany(
                                                                            token,
                                                                            typeUser)));
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons
                                                                      .edit_outlined),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                    child: Text(
                                                                      "แก้ไขข้อมมูล",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                        child: Icon(Icons
                                                            .more_vert_outlined),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                        }),
                                  ),
                                  Container(
                                    height: 45.0,
                                    width: 45.0,
                                    child: PopupMenuButton(
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(Icons.edit_outlined),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditingCompany(
                                                                      token,
                                                                      typeUser)));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    "แก้ไขรายละเอียดงาน",
                                                    style: TextStyle(
                                                      fontSize: 14,
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
                                              Icon(Icons.person_outline),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CloseTheAccount()));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    "ปิดบัญชี",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      child: Icon(
                                        Icons.more_vert_outlined,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                ));
          }
        });
  }
}
