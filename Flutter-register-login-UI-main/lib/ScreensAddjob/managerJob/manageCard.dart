// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/ScreensAddjob/managerJob/manageControl.dart';
import 'package:login_ui/ScreensAddjob/managerJob/showResume.dart';
import 'package:login_ui/Service/MessageService.dart';
import 'package:login_ui/Service/ProgressService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/ProgressModel.dart';

class Itemcard extends StatefulWidget {
  Itemcard(this.email, this.fullname, this.tel, this.name, this.id, this.token,
      this.tokenJob);
  var email;
  var fullname;
  var tel;
  var name;
  var id;
  var token;
  var tokenJob;

  @override
  _ItemcardState createState() =>
      _ItemcardState(email, fullname, tel, name, id, token, tokenJob);
}

class _ItemcardState extends State<Itemcard> {
  _ItemcardState(this.email, this.fullname, this.tel, this.name, this.id,
      this.token, this.tokenJob);
  var email;
  var fullname;
  var tel;
  var name;
  var id;
  var token;
  var tokenJob;

  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingCube()
        : GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => showResume(id)));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: SecondaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: <Widget>[
                  header(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: Column(
                      children: [
                        body(context),
                        SizedBox(height: 6),
                        footer(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ),
          );
  }

  Widget footer(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            setState(() => loading = true);
            ProgressModel data = await GetProgressID(id);
            for (var i = 0; i < data.jobId.length; i++) {
              if (data.jobId[i].id == token) {
                String resultData =
                    await StatusProgress(id, 1.toString(), i.toString());
                if (resultData == "แก้ไขข้อมูลแล้ว") {
                  final String SendMessage =
                      await SendApproveMessage(token, id, "อนุมัติ");
                  if (SendMessage == "เพิ่มข้อความสำเร็จ") {
                    showDialog(
                      context: context,
                      builder: (_) => AlertMessage(
                          "แจ้งเตือน",
                          "รับสมัครผ่านเรียบร้อยแล้ว",
                          HomeAdmin(tokenJob, "employer", token, name)),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertMessage("แจ้งเตือน",
                          "เซิฟเวอร์เกิดข้อผิดพลาด โปรดลองใหม่ภายหลัง", null),
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertMessage("แจ้งเตือน",
                        "เซิฟเวอร์เกิดข้อผิดพลาด โปรดลองใหม่ภายหลัง", null),
                  );
                }
                setState(() => loading = false);
              }
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ButtonColor),
          ),
          child: Text(
            "ยืนยันการร้องขอ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () async {
            setState(() => loading = true);
            ProgressModel data = await GetProgressID(id);
            for (var i = 0; i < data.jobId.length; i++) {
              if (data.jobId[i].id == token) {
                String resultData =
                    await StatusProgress(id, 0.toString(), i.toString());
                if (resultData == "แก้ไขข้อมูลแล้ว") {
                  final String SendMessage =
                      await SendApproveMessage(token, id, "ปฏิเสธ");
                  if (SendMessage == "เพิ่มข้อความสำเร็จ") {
                    showDialog(
                      context: context,
                      builder: (_) => AlertMessage(
                          "แจ้งเตือน",
                          "ปฏิเศษสมัครผ่านเรียบร้อยแล้ว",
                          HomeAdmin(tokenJob, "employer", token, name)),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertMessage("แจ้งเตือน",
                          "เซิฟเวอร์เกิดข้อผิดพลาด โปรดลองใหม่ภายหลัง", null),
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertMessage("แจ้งเตือน",
                        "เซิฟเวอร์เกิดข้อผิดพลาด โปรดลองใหม่ภายหลัง", null),
                  );
                }
                setState(() => loading = false);
              }
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Danger),
          ),
          child: Text(
            "ปฏิเศษการร้องขอ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 4,
            offset: Offset(2, 4), // Shadow position
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          labelText(
            label: "ตำแหน่ง: ",
            value: name,
          ),
          SizedBox(
            width: 20,
          ),
          labelText(
            label: "อีเมลย์: ",
            value: email,
          ),
          labelText(
            label: "เบอร์ติดต่อ: ",
            value: tel,
          ),
        ],
      ),
    );
  }

  Widget labelText({String label, String value}) {
    return Row(
      children: [
        Text(
          label,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        )
      ],
    );
  }

  Widget header(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/user.png',
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        SizedBox(width: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ชื่อคุณ: " + fullname,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
