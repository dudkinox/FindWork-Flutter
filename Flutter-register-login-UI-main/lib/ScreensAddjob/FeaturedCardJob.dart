import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/jobModel.dart';

import 'DetailCardJob.dart';
import 'EditingCardJob.dart';

class FeaturedCardJob extends StatelessWidget {
  final featuredJobs;
  final token;
  final typeUser;
  final id;
  final VoidCallback onClicked;

  const FeaturedCardJob(
      {this.featuredJobs,
      this.typeUser,
      this.token,
      this.id,
      this.onClicked,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCardJob(typeUser, token)));
      },
      child: FutureBuilder<JobDataModel>(
          future: TopicWorkFindID(id),
          builder: (context, AsyncSnapshot snapshot) {
            JobDataModel data = snapshot?.data;
            if (snapshot?.connectionState != ConnectionState.done) {
              return Text("");
            } else {
              String money = "";
              if (data.departmentId.type[0] == "salary") {
                money = data.departmentId.salary[0];
              } else {
                money = data.departmentId.partTime[0];
              }
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                margin: EdgeInsets.symmetric(horizontal: (10)),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all((4)),
                          width: (70),
                          height: (50),
                          child: Image(
                              image: NetworkImage(data.image),
                              fit: BoxFit.cover),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.departmentId.name[0],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              data.company,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        typeUser == "employee"
                            ? Text("")
                            : Container(
                                width: (30),
                                height: (30),
                                child: PopupMenuButton(
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit_outlined),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditingCardJob(
                                                                  token,
                                                                  typeUser)));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "แก้ไขรายละเอียดงาน",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete_forever_outlined),
                                          GestureDetector(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "ลบงาน",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  child: Icon(
                                    Icons.more_vert_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ButtonColor),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildChip(data.departmentId.type[0] == "salary"
                            ? "งานประจำ"
                            : "พาร์ทไทม์"),
                        buildChip(featuredJobs.text2),
                        buildChip(featuredJobs.text3),
                        buildChip(featuredJobs.text4)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          money,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(data.departmentId.jobTime[0])
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Chip buildChip(String text) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
