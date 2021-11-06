import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Screens/homehome.dart';
import 'package:login_ui/model/favoriteModel.dart';
import 'package:login_ui/model/jobModel.dart';

import 'Animation/Fade_Animation.dart';

import 'Screens/loading.dart';

import 'ScreensAddjob/FeaturedCardJob.dart';
import 'SelectCheckbox/choices.dart';
import 'Service/JobService.dart';
import 'Themes/Themes.dart';

class DetailsPage extends StatelessWidget {
  final String imgUrl;
  final String id;
  final String token;
  final String typeUser;

  Future<bool> status(String token, String jobId) async {
    FavoriteModel status = await GetFavorite(token);
    if (status != null) {
      for (var i = 0; i < status.jobId.length; i++) {
        if (status.jobId[i] == null) {
          return false;
        }
        if (status.jobId[i] == jobId) {
          return true;
        }
      }
    }
    return false;
  }

  const DetailsPage(this.imgUrl, this.id, this.token, this.typeUser);
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
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeHome(0, token, typeUser)));
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
                                child: FutureBuilder<bool>(
                                  future: status(token, id),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    bool favorite = snapshot?.data;
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return Text("");
                                    } else {
                                      return FavoriteButton(
                                        isFavorite: favorite,
                                        valueChanged: (_isFavorite) {
                                          if (_isFavorite == true) {
                                            AddFavorite(id, token);
                                          } else {
                                            DelFavorite(id, token);
                                          }
                                        },
                                      );
                                    }
                                  },
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
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.company,
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
                                          children: buildRequirements(
                                              data.departmentId.detail[0]),
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
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  data.departmentId.name.length,
                                  (HomeAddjob) => FeaturedCardJob(
                                      featuredJobs: demoFeatured[0],
                                      typeUser: typeUser,
                                      token: token,
                                      id: id,
                                      img: imgUrl),
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

List<Widget> buildRequirements(String Detail) {
  List<Widget> list = [];
  for (var i = 0; i < getJobsRequirements(Detail).length; i++) {
    list.add(buildRequirement(getJobsRequirements(Detail)[i]));
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
