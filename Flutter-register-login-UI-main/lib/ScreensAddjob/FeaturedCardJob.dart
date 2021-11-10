import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/jobModel.dart';

import 'DetailCardJob.dart';
import 'EditingCardJob.dart';
import 'HomeAddjob.dart';

class FeaturedCardJob extends StatelessWidget {
  final featuredJobs;
  final token;
  final typeUser;
  final id;
  final img;
  final VoidCallback onClicked;

  const FeaturedCardJob(
      {this.featuredJobs,
      this.typeUser,
      this.token,
      this.id,
      this.img,
      this.onClicked,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<JobDataModel>(
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailCardJob(
                        typeUser,
                        token,
                        img,
                        data.departmentId.name[0],
                        data.company,
                        data.departmentId.type[0],
                        data.departmentId.detail[0],
                        money,
                        data.departmentId.jobTime[0],
                        id),
                  ),
                );
              },
              child: Container(
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
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (70),
                            height: (50),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(img),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(15.0)),
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
                                    onSelected: (choice) async {
                                      switch (choice) {
                                        case 'edit':
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditingCardJob(
                                                          token,
                                                          typeUser,
                                                          data.departmentId
                                                              .name[0],
                                                          data.departmentId
                                                              .type[0],
                                                          money,
                                                          data.departmentId
                                                              .jobTime[0],
                                                          id)));
                                          break;
                                        case 'remove':
                                          final String status =
                                              await DelJobDetail(data?.jobId);
                                          if (status == "ลบสำเร็จ") {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertMessage(
                                                  "แจ้งเตือน",
                                                  "ลบตำแหน่งงานที่สมัครเรียบร้อยแล้ว",
                                                  HomeAddjob(token, typeUser)),
                                            );
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertMessage(
                                                  "แจ้งเตือน",
                                                  "ลบข้อมูลมีปัญหา โปรดลองใหม่ภายหลัง",
                                                  null),
                                            );
                                          }
                                          break;
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(Icons.edit_outlined),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "แก้ไขรายละเอียดงาน",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        value: 'edit',
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete_forever_outlined),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "ลบงาน",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        value: 'remove',
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildChip(data.departmentId.type[0] == "salary"
                            ? "งานประจำ"
                            : data.departmentId.type[0] == ""
                                ? "ยังไม่ระบุ"
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
              ),
            );
          }
        });
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
