// ignore_for_file: must_be_immutable, sdk_version_set_literal

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/ScreensAddjob/managerJob/manageControl.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Service/locaitonService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/image.dart';
import 'package:login_ui/model/departmentMeodel.dart';
import 'package:login_ui/model/imageModel.dart';
import 'package:login_ui/model/jobModel.dart';
import 'package:login_ui/model/loginModel.dart';

import '../../details_screen.dart';
import '../../main.dart';
import '../EditingCardJob.dart';
import '../EditingCompany.dart';
import '../FeaturedCardJob.dart';
import 'CloseTheAccount.dart';

class HomeEmployer extends StatefulWidget {
  var token;
  var typeUser;
  HomeEmployer(this.token, this.typeUser);

  @override
  _HomeEmployerState createState() => _HomeEmployerState(token, typeUser);
}

class _HomeEmployerState extends State<HomeEmployer> {
  _HomeEmployerState(this.token, this.typeUser);
  var token;
  var typeUser;

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  Future<void> addDepartment(String id) async {
    AccountModel get = await FindID(token);
    DepaertmentModel statusAddDepartment = await AddDepartment(get?.jobId);
    var index = statusAddDepartment.length;
    if (statusAddDepartment.message == "เพิ่มตำแหน่งสำเร็จ") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => EditingCardJob(
                    token,
                    typeUser,
                    "",
                    "",
                    "",
                    "",
                    id,
                    "",
                    index,
                  )));

      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertMessage(
            "แจ้งเตือน", "เกิดข้อผิดพลาดทาง Server โปรดลองใหม่ภายหลัง", null),
      );
    }
  }

  var img;
  var LatLocation;
  var LngLocation;

  List<String> listImage = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: FutureBuilder<AccountModel>(
        future: FindID(token),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Loader();
          } else {
            AccountModel dataList = snapshot?.data;
            return FutureBuilder<JobDataModel>(
                future: TopicWorkFindJob_ID(dataList?.jobId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  JobDataModel jobData = snapshot?.data;
                  return FutureBuilder<ResumeModel>(
                      future: PreviewResume(token),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Loader();
                        }
                        ResumeModel previwerImage = snapshot?.data;
                        if (previwerImage?.link == "") {
                          img = DefaultImage;
                        } else {
                          img = previwerImage?.link;
                        }
                        return FutureBuilder<dynamic>(
                            future: FindIDLocation(dataList?.id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Loader();
                              }
                              dynamic location = snapshot?.data;
                              if (location == "หาไม่เจอ") {
                                LatLocation = "";
                                LngLocation = "";
                              } else {
                                LatLocation = location?.latitude;
                                LngLocation = location?.longitude;
                              }
                              return Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.white,
                                  actions: [
                                    GestureDetector(
                                      child: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white.withOpacity(.5),
                                        ),
                                        child: IconButton(
                                          iconSize: 30,
                                          color: Colors.black,
                                          icon: const Icon(Icons.edit_outlined),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditingCompany(
                                                  token,
                                                  typeUser,
                                                  dataList?.id,
                                                  jobData?.company,
                                                  jobData
                                                      .departmentId?.detail[0],
                                                  jobData?.province,
                                                  jobData?.district,
                                                  jobData?.subDistrict,
                                                  dataList?.jobId,
                                                  dataList?.image,
                                                  LatLocation.toString(),
                                                  LngLocation.toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white.withOpacity(.5),
                                        ),
                                        child: IconButton(
                                          iconSize: 30,
                                          color: Colors.black,
                                          icon:
                                              const Icon(Icons.person_outline),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CloseTheAccount(
                                                  token,
                                                  typeUser,
                                                  dataList?.id,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white.withOpacity(.5),
                                        ),
                                        child: Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child: IconButton(
                                            iconSize: 30,
                                            color: Colors.black,
                                            icon: const Icon(
                                                Icons.exit_to_app_rounded),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                return MyApp();
                                              }));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  title: Text(
                                    dataList?.fullname ?? 'กำลังโหลด',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                body: RefreshIndicator(
                                  onRefresh: onPullToRefresh,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        FutureBuilder<List<String>>(
                                            future:
                                                DepartmentdataImage(jobData.id),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done) {
                                                return Loader();
                                              }
                                              listImage = snapshot.data;
                                              return Container(
                                                height: 350.0,
                                                width: double.infinity,
                                                child: CarouselSlider(
                                                  options: CarouselOptions(
                                                    enlargeCenterPage: true,
                                                    enableInfiniteScroll: false,
                                                    autoPlay: true,
                                                  ),
                                                  items: listImage
                                                          ?.map(
                                                              (e) => ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    child:
                                                                        Stack(
                                                                      fit: StackFit
                                                                          .expand,
                                                                      children: <
                                                                          Widget>[
                                                                        Image
                                                                            .network(
                                                                          e,
                                                                          width:
                                                                              1050,
                                                                          height:
                                                                              350,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ))
                                                          ?.toList() ??
                                                      [],
                                                ),
                                              );
                                            }),
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
                                                  jobData.company,
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
                                                      jobData.province +
                                                          " " +
                                                          jobData.district +
                                                          " " +
                                                          jobData.subDistrict,
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
                                                        Expanded(
                                                          child:
                                                              SingleChildScrollView(
                                                            physics:
                                                                BouncingScrollPhysics(),
                                                            child: Column(
                                                              children:
                                                                  buildRequirements(
                                                                jobData
                                                                    .departmentId
                                                                    .detail[0],
                                                              ),
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
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () => {
                                                        addDepartment(
                                                            jobData.id),
                                                      },
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        HomeAdmin(
                                                                          token,
                                                                          typeUser,
                                                                          jobData
                                                                              ?.id,
                                                                          jobData
                                                                              .departmentId
                                                                              ?.name[0],
                                                                        )));
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
                                                      jobData.departmentId?.name
                                                          ?.length,
                                                      (indexDepartment) =>
                                                          FutureBuilder(
                                                              future: GetImageIdDepartment(
                                                                  jobData?.id,
                                                                  indexDepartment
                                                                      .toString()),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                        .connectionState !=
                                                                    ConnectionState
                                                                        .done) {
                                                                  return Container();
                                                                } else {
                                                                  var idImage =
                                                                      snapshot
                                                                          ?.data;
                                                                  return FutureBuilder(
                                                                      future: PreviewImageDepartment(
                                                                          idImage),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        if (snapshot.connectionState ==
                                                                            ConnectionState.done) {
                                                                          ResumeModel
                                                                              link =
                                                                              snapshot.data;
                                                                          return FeaturedCardJob(
                                                                            index:
                                                                                indexDepartment,
                                                                            featuredJobs:
                                                                                demoFeatured[0],
                                                                            token:
                                                                                token,
                                                                            typeUser:
                                                                                typeUser,
                                                                            id: jobData.id,
                                                                            imgDepartment:
                                                                                listImage[indexDepartment],
                                                                            img:
                                                                                listImage[indexDepartment],
                                                                          );
                                                                        } else {
                                                                          return Container();
                                                                        }
                                                                      });
                                                                }
                                                              }),
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
                                ),
                              );
                            });
                      });
                });
          }
        },
      ),
    );
  }
}
