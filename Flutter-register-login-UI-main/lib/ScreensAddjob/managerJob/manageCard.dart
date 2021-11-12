import 'package:flutter/material.dart';
import 'package:login_ui/ScreensAddjob/managerJob/showResume.dart';
import 'package:login_ui/Service/ProgressService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/ProgressModel.dart';
import 'managelistdata.dart';

class Itemcard extends StatelessWidget {
  Itemcard(this.email, this.fullname, this.tel, this.name, this.id, this.token);
  var email;
  var fullname;
  var tel;
  var name;
  var id;
  var token;
  var status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => showResume()));
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
                  footer(),
                ],
              ),
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            ProgressModel data = await GetProgressID(id);
            for (var i = 0; i < data.jobId.length; i++) {
              if (data.jobId[i].id == token) {
                data.jobId[i].id = token;
                data.jobId[i].status = "อนุมัติแล้ว";
              }
            }
            String resultData = await AcceptProgress(id, data.jobId);
            print(resultData);
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
          onPressed: () {},
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
