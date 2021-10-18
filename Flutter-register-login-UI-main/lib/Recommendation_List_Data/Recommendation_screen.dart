import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/details_screen.dart';
import 'package:login_ui/model/jobModel.dart';

class Recommendation extends StatelessWidget {
  final String imgUlr;
  final String location;

  const Recommendation(this.imgUlr, this.location);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<JobDataModel>>(
        future: TopicWork(),
        builder: (context, AsyncSnapshot snapshot) {
          JobDataModel data = new JobDataModel();
          if (snapshot?.connectionState != ConnectionState.done) {
            return LoadingCube();
          } else {
            for (var item in snapshot?.data) {
              data?.company = item.company;
              data?.departmentId = item.departmentId;
              data?.district = item.district;
              data?.id = item.id;
              data?.image = item.image;
              data?.jobId = item.jobId;
              data?.province = item.province;
              data?.subDistrict = item.subDistrict;
            }
            return Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DetailsPage(imgUlr, data.id),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(imgUlr),
                                    fit: BoxFit.cover),
                              ),
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
                                  data.company,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: PrimaryColor,
                                        ),
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          data.departmentId.status[0] == true
                                              ? 'มีตำแหน่งงานเปิดรับอยู่'
                                              : data.departmentId.status[0] ==
                                                      false
                                                  ? 'ไม่มีตำแหน่งเปิดรับสมัครแล้ว'
                                                  : '',
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
            );
          }
        },
      ),
    );
  }
}
