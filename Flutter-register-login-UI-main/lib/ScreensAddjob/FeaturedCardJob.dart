// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/image.dart';
import 'package:login_ui/model/jobModel.dart';
import 'DetailCardJob.dart';
import 'EditingCardJob.dart';
import 'modelsAddjob/HomeEmployer.dart';

class FeaturedCardJob extends StatelessWidget {
  final index;
  final featuredJobs;
  final token;
  final typeUser;
  final id;
  var img;
  var imgDepartment;
  final VoidCallback onClicked;

  FeaturedCardJob(
      {this.index,
      this.featuredJobs,
      this.typeUser,
      this.token,
      this.id,
      this.img,
      this.imgDepartment,
      this.onClicked,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (img == null) {
      img = DefaultImage;
    }
    return FutureBuilder<JobDataModel>(
        future: TopicWorkFindID(id),
        builder: (context, AsyncSnapshot snapshot) {
          JobDataModel data = snapshot?.data;
          if (snapshot?.connectionState != ConnectionState.done) {
            return LoadingRipple();
          } else {
            String money = "";
            if (data.departmentId.type[index] == "salary") {
              money = data.departmentId.salary[index];
            } else {
              money = data.departmentId.partTime[index];
            }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailCardJob(
                        typeUser,
                        token,
                        imgDepartment,
                        data.departmentId.name[index],
                        data.company,
                        data.departmentId.type[index],
                        data.departmentId.detail[index],
                        money,
                        data.departmentId.jobTime[index],
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
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.departmentId.name[index],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      data.company,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                                            .name[index],
                                                        data.departmentId
                                                            .type[index],
                                                        money,
                                                        data.departmentId
                                                            .jobTime[index],
                                                        id,
                                                        data.departmentId
                                                            .lineID[index],
                                                        index,
                                                      )));
                                          break;
                                        case 'photo':
                                          var image = await ImagePicker()
                                              .getImage(
                                                  source: ImageSource.gallery);
                                          if (image?.path != null) {
                                            String status =
                                                await UploadImageDepartment(
                                                    index.toString(),
                                                    id,
                                                    File(image.path));

                                            if (status ==
                                                "อัพโหลดรูปภาพเรียบร้อย") {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertMessage(
                                                    "แจ้งเตือน",
                                                    "อัพโหลดสำเร็จ กรุณา Refresh!",
                                                    null),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertMessage(
                                                    "แจ้งเตือน",
                                                    "การอัพโหลดมีปัญหา โปรดลองใหม่ภายหลัง",
                                                    null),
                                              );
                                            }
                                          }
                                          break;
                                        case 'remove':
                                          final String status =
                                              await DelJobDetail(data?.jobId,
                                                  index.toString());
                                          if (status == "ลบตำแหน่งงานสำเร็จ") {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertMessage(
                                                  "แจ้งเตือน",
                                                  "ลบตำแหน่งงานที่สมัครเรียบร้อยแล้ว",
                                                  HomeEmployer(
                                                      token, typeUser)),
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
                                            Icon(Icons.camera_alt),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "เพิ่มรูปภาพ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        value: 'photo',
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
                        buildChip(data.departmentId.type[index] == "salary"
                            ? "งานประจำ"
                            : data.departmentId.type[index] == ""
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
                        Text(data.departmentId.jobTime[index])
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
