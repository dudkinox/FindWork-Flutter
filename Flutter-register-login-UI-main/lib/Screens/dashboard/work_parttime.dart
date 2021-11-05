import 'package:flutter/material.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/jobModel.dart';

import 'dashboard_All.dart';

class work_parttime extends StatelessWidget {
  work_parttime(this.token);
  var token;
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
                                        dashboard_All(token)))
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
                future: TopicWork(),
                builder: (context, AsyncSnapshot snapshot) {
                  List result = [];
                  if (snapshot?.connectionState != ConnectionState.done) {
                    return LoadingCube();
                  } else {
                    for (JobDataModel data in snapshot?.data) {
                      if (data.departmentId.type.single == "parttime") {
                        result.add(Recommendation(
                            data?.image,
                            data?.company,
                            data.province +
                                " " +
                                data?.district +
                                " " +
                                data?.subDistrict,
                            data?.id,
                            token));
                      }
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: result?.length,
                      itemBuilder: (context, index) {
                        return result[index];
                      },
                    );
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
