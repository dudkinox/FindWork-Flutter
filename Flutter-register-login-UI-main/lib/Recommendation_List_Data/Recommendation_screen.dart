import 'package:flutter/material.dart';
import 'package:login_ui/Controller/JobController.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/details_screen.dart';
import 'package:login_ui/model/jobModel.dart';

JobDataModel JobData = JobDataModel();

List JobDataList = [
  Recommendation(JobData.image, JobData.province),
];

List RecommendationList = [
  Recommendation(
      "https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801__480.jpg",
      "จันเกษม"),
  Recommendation(
      "https://cdn.pixabay.com/photo/2016/11/19/16/46/architecture-1840263__480.jpg",
      "จันเกษม"),
  Recommendation(
      "https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801__480.jpg",
      "จันเกษม"),
];

class Recommendation extends StatelessWidget {
  final String imgUlr;
  final String location;

  const Recommendation(this.imgUlr, this.location);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DetailsPage(imgUlr),
              ),
            );
          },
          child: Container(
            height: 370.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 250.0,
                      width: double.infinity,
                      child: FutureBuilder<JobDataModel>(
                        future: Jobdata(),
                        builder: (context, snapshot) {
                          return new Container(
                            decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(JobData.image),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " คาเฟ่",
                            style: TextStyle(
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: PrimaryColor,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                location,
                                style: TextStyle(
                                    color: PrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: PrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    "4(24 รีวิว)",
                                    style: TextStyle(
                                        color: PrimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Text(
                                "รายละเอียด >",
                                style: TextStyle(
                                  color: PrimaryColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
