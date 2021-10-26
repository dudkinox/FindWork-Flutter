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
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/model/loginModel.dart';

import 'EditingCompany.dart';
import 'managerJob/manageControl.dart';

class HomeAddjob extends StatefulWidget {
  final String imgUrl;

  const HomeAddjob(String s, {Key key, this.imgUrl}) : super(key: key);
  @override
  _HomeAddjobState createState() => _HomeAddjobState(imgUrl);
}

class _HomeAddjobState extends State<HomeAddjob> {
  final String imgUrl;

  String token = "";

  _HomeAddjobState(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: FlutterSession().get('token'),
                    builder: (context, snapshot) {
                      token = snapshot.data;
                      if (snapshot.connectionState != ConnectionState.done) {
                        return LoadingRipple();
                      } else {
                        return FadeAnimation(
                          1.0,
                          FutureBuilder<ResumeModel>(
                              future: PreviewImageCopany(token),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
                                  return LoadingFadingCube();
                                } else {
                                  return Container(
                                    height: 350.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: PrimaryColor,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(snapshot.data?.link),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 160.0,
                                          left: 20.0,
                                          right: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              height: 50.0,
                                              width: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
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
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          LoginScreen()));
                                                    },
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color:
                                                  Colors.white.withOpacity(.5),
                                            ),
                                            child: PopupMenuButton(
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditingCompany()));
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons
                                                            .edit_outlined),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Text(
                                                            "แก้ไขข้อมมูล",
                                                            style: TextStyle(
                                                                fontSize: 14.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                              child: Icon(
                                                  Icons.more_vert_outlined),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }),
                        );
                      }
                    }),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1.1,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ชื่อบริษัท",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: PrimaryColor,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "จันทรเกษม....",
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
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "ข้อมูลบริษัท",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                                    keyboardType: TextInputType.multiline,
                                    decoration: new InputDecoration(
                                      hintText: "ข้อมูลบริษัท",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[300],
                                            width: 5.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[300],
                                            width: 5.0),
                                      ),
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ตำแหน่งงานที่รับสมัคร",
                              style: TextStyle(
                                  color: PrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeAdmin()));
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
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              demoFeatured.length,
                              (HomeAddjob) => FeaturedCardJob(
                                featuredJobs: demoFeatured[0],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
