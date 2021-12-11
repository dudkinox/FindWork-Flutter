import 'package:flutter/material.dart';
import 'package:login_ui/Themes/Themes.dart';

class notifyPage extends StatefulWidget {
  notifyPage(this.img, this.msg, this.company, this.lineID);
  var img;
  var msg;
  var company;
  var lineID;
  @override
  _notifyPageState createState() => _notifyPageState(img, msg, company, lineID);
}

class _notifyPageState extends State<notifyPage> {
  _notifyPageState(this.img, this.msg, this.company, this.lineID);
  var img;
  var msg;
  var company;
  var lineID;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset(4, 5), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
            child: Image.network(
              img,
              width: MediaQuery.of(context).size.width * 0.35,
              // height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "แจ้งเตือนจาก : " + company,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor),
                ),
                Text("      ** กรุณาติดต่อ **"),
                Text("Line ID : " + lineID),
                Text(
                  "สถานะ : " + msg,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Danger),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
