import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/jobModel.dart';

class Work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.2,
      Container(
        height: 610.0,
        width: double.infinity,
        color: PrimaryColor,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: TabBar(
                labelColor: PrimaryColor,
                indicatorColor: PrimaryColor,
                unselectedLabelColor: PrimaryColor,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_work_outlined),
                    text: "งานประจำ",
                  ),
                  Tab(
                    icon: Icon(Icons.home_work_rounded),
                    text: "พาร์ทไทม์",
                  ),
                  Tab(
                    icon: Icon(Icons.favorite_border),
                    text: "ชื่นชอบ",
                  ),
                ]),
            body: TabBarView(children: [
              Container(
                height: 400.0,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("คำแนะนำ",
                                    style: TextStyle(
                                        color: PrimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                                Text(
                                  "งานที่คุณอาจชอบ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                              ],
                            ),
                            Text(
                              "ดูทั้งหมด",
                              style: TextStyle(color: PrimaryColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 400.0,
                        width: 400.0,
                        child: FutureBuilder<List<JobDataModel>>(
                          future: TopicWork(),
                          builder: (context, snapshot) {
                            List result = [];
                            for (var data in snapshot.data) {
                              result.add(Recommendation(
                                  data.image,
                                  data.province +
                                      " " +
                                      data.district +
                                      " " +
                                      data.subDistrict));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return result[index];
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 400.0,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "คำแนะนำ",
                                  style: TextStyle(
                                      color: PrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  "งานที่คุณอาจชอบ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                              ],
                            ),
                            Text(
                              "ดูทั้งหมด",
                              style: TextStyle(
                                color: PrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 400.0,
                        width: 400.0,
                        child: FutureBuilder<List<JobDataModel>>(
                          future: TopicWork(),
                          builder: (context, snapshot) {
                            List result = [];
                            for (var data in snapshot.data) {
                              result.add(Recommendation(
                                  data.image,
                                  data.province +
                                      " " +
                                      data.district +
                                      " " +
                                      data.subDistrict));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return result[index];
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 400.0,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "คำแนะนำ",
                                  style: TextStyle(
                                      color: PrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  "งานที่คุณอาจชอบ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                              ],
                            ),
                            Text(
                              "ดูทั้งหมด",
                              style: TextStyle(
                                color: PrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 400.0,
                        width: 400.0,
                        child: FutureBuilder<List<JobDataModel>>(
                          future: TopicWork(),
                          builder: (context, snapshot) {
                            List result = [];
                            for (var data in snapshot.data) {
                              result.add(Recommendation(
                                  data.image,
                                  data.province +
                                      " " +
                                      data.district +
                                      " " +
                                      data.subDistrict));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return result[index];
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
