import 'package:flutter/material.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/jobModel.dart';

class work_favorite extends StatelessWidget {
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
                        "คำแนะนำ",
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
                builder: (context, AsyncSnapshot snapshot) {
                  List result = [];
                  if (snapshot?.connectionState != ConnectionState.done) {
                    return LoadingCube();
                  } else {
                    for (var data in snapshot.data) {
                      result.add(Recommendation(
                          data.image,
                          data.company,
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
