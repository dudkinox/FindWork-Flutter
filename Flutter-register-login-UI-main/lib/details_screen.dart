import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/model/jobModel.dart';

import 'Animation/Fade_Animation.dart';
import 'Screens/loading.dart';
import 'ScreensAddjob/HomeAddjob.dart';
import 'ScreensAddjob/detailJob.dart';
import 'SelectCheckbox/choices.dart';
import 'Service/JobService.dart';
import 'Themes/Themes.dart';

class DetailsPage extends StatelessWidget {
  final String imgUrl;
  final String id;

  const DetailsPage(this.imgUrl, this.id);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<JobDataModel>(
        future: TopicWorkFindID(id),
        builder: (context, AsyncSnapshot snapshot) {
          JobDataModel data = snapshot?.data;
          if (snapshot?.connectionState != ConnectionState.done) {
            return LoadingCube();
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
                      Container(
                        height: 350.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(imgUrl), fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 160.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white.withOpacity(.5),
                                ),
                                child: Icon(Icons.date_range_outlined),
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
                              data.company,
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
                                    featuredJobs: demoFeatured[0],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
