import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/ScreensAddjob/detailJob.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';

class HomeAddjob extends StatelessWidget {
  final String imgUrl;

  const HomeAddjob(this.imgUrl);
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
                FadeAnimation(
                  1.0,
                  Container(
                    height: 350.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2018/12/02/06/33/skyscrapers-3850732_960_720.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 160.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white.withOpacity(.5),
                              ),
                              child: Transform.rotate(
                                  angle: 180 * pi / 180,
                                  child: IconButton(
                                    iconSize: 30,
                                    color: Colors.black,
                                    icon: const Icon(Icons.exit_to_app_rounded),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                  )),
                            ),
                          ),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: Icon(Icons.settings_outlined),
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
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      children: buildRequirements(),
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
                            Text(
                              "รายชื่อผู้สมัคร",
                              style: TextStyle(
                                color: PrimaryColor,
                              ),
                            ),
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
                              (HomeAddjob) => FeaturedCard(
                                featuredJobs: demoFeatured[HomeAddjob],
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

List<Widget> buildRequirements() {
  List<Widget> list = [];
  for (var i = 0; i < getJobsRequirements().length; i++) {
    list.add(buildRequirement(getJobsRequirements()[i]));
  }
  return list;
}

Widget buildRequirement(String requirement) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            requirement,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}
