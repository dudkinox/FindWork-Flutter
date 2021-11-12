// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/ScreensAddjob/HomeAddjob.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Service/ProgressService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/notification.dart';
import 'package:login_ui/model/ProgressModel.dart';

class DetailCardJob extends StatefulWidget {
  DetailCardJob(this.typeUser, this.token, this.img, this.name, this.company,
      this.type, this.detail, this.money, this.jobTime, this.id_job);
  var typeUser;
  var token;
  var img;
  var name;
  var company;
  var type;
  var detail;
  var money;
  var jobTime;
  var id_job;

  final TextEditingController detailCompany = new TextEditingController();

  @override
  _DetailCardJobState createState() => _DetailCardJobState(typeUser, token, img,
      name, company, type, detail, money, jobTime, id_job);
}

class _DetailCardJobState extends State<DetailCardJob> {
  _DetailCardJobState(
      this.typeUser,
      this.token,
      this.img,
      this.name,
      this.company,
      this.type,
      this.detail,
      this.money,
      this.jobTime,
      this.id_job);
  var typeUser;
  var token;
  var img;
  var name;
  var company;
  var type;
  var detail;
  var money;
  var jobTime;
  var id_job;

  var detailCompany = new TextEditingController();

  bool _status = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    detailCompany.text = detail;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          company,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all((4)),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    company,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: ButtonColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            (type == "salary"
                                ? "งานประจำ"
                                : type == ""
                                    ? "ยังไม่ระบุ"
                                    : "พาร์ทไทม์"),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ButtonColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            demoFeatured[0].text2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ButtonColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            demoFeatured[0].text3,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ButtonColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            demoFeatured[0].text4,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      money,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      jobTime,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "คุณสมบัติ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                    child: typeUser == "employee"
                        ? TextFormField(
                          maxLines: 8,
                            readOnly: true,
                            keyboardType: TextInputType.multiline,
                            controller: detailCompany,
                            decoration: new InputDecoration(
                              hintText: "คุณสมบัติ",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                            ),
                          )
                        : TextFormField(
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            controller: detailCompany,
                            decoration: new InputDecoration(
                              hintText: "คุณสมบัติ",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                            ),
                            enabled: false,
                          )),
                SizedBox(
                  height: 20,
                ),
                typeUser == "employee"
                    ? FutureBuilder<dynamic>(
                        future: GetProgressID(token),
                        builder: (context, snapshot) {
                          bool statusRegister = true;
                          var text_accept = "";
                          var text_alert = "";
                          var text_color;
                          if (snapshot?.connectionState !=
                              ConnectionState.done) {
                            return LoadingRipple();
                          } else {
                            var result = snapshot?.data;
                            if (result != "ไม่พบ") {
                              for (var i = 0; i < result.jobId.length; i++) {
                                if (result.jobId[i].id == id_job) {
                                  if (result.jobId[i].status == "อนุมัติ") {
                                    text_accept =
                                        "บริษัทได้รับอนุมัติการสมัครของคุณแล้ว";
                                    text_alert = "บริษัทได้รับคุณเข้าทำงานแล้ว";
                                    text_color = Color(0xFF278E95);
                                    statusRegister = false;
                                    break;
                                  } else if (result.jobId[i].status ==
                                      "ปฏิเสธ") {
                                    text_accept =
                                        "บริษัทปฏิเสธการสมัครของคุณแล้ว";
                                    text_alert =
                                        "บริษัทได้ปฏิเศษการสมัครของคุณ กรุณาติดต่อบริษัทเพื่อสอบถาม";
                                    text_color = Danger;
                                    statusRegister = false;
                                    break;
                                  } else if(result.jobId[i].status ==
                                      "รอ") {
                                    text_accept = "รอการติดต่อกลับ";
                                    text_alert =
                                        "กรุณารอทางบริษัทพิจารณาและติดต่อกลับ";
                                        text_color = Colors.white38;
                                    statusRegister = false;
                                    break;
                                  }
                                  break;
                                }
                              }
                            }
                            return Container(
                                alignment: Alignment.center,
                                child: statusRegister == true
                                    ? RaisedButton(
                                        child: new Text("ยื่นสมัครงาน"),
                                        textColor: Colors.white,
                                        color: PrimaryColor,
                                        onPressed: () async {
                                          final String status =
                                              await AddProgress(token, id_job);
                                          if (status == "เพิ่มสำเร็จ") {
                                            await showNotification(
                                                company, name);
                                            setState(() {});
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertMessage(
                                                  "แจ้งเตือน",
                                                  "เซิฟเวอร์เกิดข้อผิดพลาด โปรดลองใหม่ภายหลัง",
                                                  null),
                                            );
                                          }
                                        },
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0)),
                                      )
                                    : RaisedButton(
                                        child: new Text(text_accept),
                                        textColor: Colors.white,
                                        color: text_color,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertMessage(
                                                "แจ้งเตือน", text_alert, null),
                                          );
                                        },
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0)),
                                      ));
                          }
                        })
                    : Container(
                        child: null,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
