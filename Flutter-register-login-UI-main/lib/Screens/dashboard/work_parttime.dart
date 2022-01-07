// ignore_for_file: must_be_immutable, sdk_version_set_literal, camel_case_types

import 'package:flutter/material.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:login_ui/Service/matchingService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/notfound.dart';
import 'package:login_ui/model/jobModel.dart';

import 'dashboard_All.dart';

class work_parttime extends StatelessWidget {
  work_parttime(this.token, this.typeUser, this.matching);
  var token;
  var typeUser;
  var img;
  var matching;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        "งานแนะนำ",
                        style: TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      Text(
                        "งานที่คุณอาจชอบ",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        dashboard_All(
                                            token, typeUser, matching)))
                          },
                          child: Text(
                            "ดูทั้งหมด",
                            style: TextStyle(color: PrimaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.52,
              width: MediaQuery.of(context).size.width * 1,
              child: FutureBuilder<List<JobDataModel>>(
                future: FindMatching(token),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot?.connectionState != ConnectionState.done) {
                    return Container();
                  } else {
                    var data = [];
                    var department = [];

                    for (JobDataModel items in snapshot?.data) {
                      var count = items?.departmentId?.type?.length;
                      for (var i = 0; i < count; i++) {
                        if (items?.departmentId?.name[i] != "") {
                          if (items?.departmentId?.type[i] == "parttime") {
                            data.add(items);
                            department.add(items?.departmentId);
                          }
                        }
                      }
                    }
                    return data.length <= 0
                        ? notFound()
                        : ListView?.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Recommendation(
                                  data[0].image,
                                  data[0].company,
                                  data[0].province +
                                      " " +
                                      data[0].district +
                                      " " +
                                      data[0].subDistrict,
                                  data[0].id,
                                  token,
                                  typeUser,
                                  index,
                                  department);
                            });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
