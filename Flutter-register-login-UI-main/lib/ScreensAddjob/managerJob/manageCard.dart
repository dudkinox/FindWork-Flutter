import 'package:flutter/material.dart';
import 'managelistdata.dart';

class Itemcard extends StatelessWidget {
  final user person;
  final Function press;
  const Itemcard({
    Key key,
    this.person,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (Colors.amberAccent),
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
    );
  }

  Widget footer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button(
          buttonName: "ยืนยันการร้องขอ",
          color: Colors.green[700],
          onpress: {},
        ),
        Spacer(),
        button(
          buttonName: "ปฏิเศษการร้องขอ",
          color: Colors.redAccent[400],
          onpress: {},
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
            label: "หมายเลขห้อง",
            value: person.numberroom.toString(),
          ),
          SizedBox(
            width: 80,
          ),
          labelText(
            label: "วันที่ยื่นคำร้อง",
            value: person.date,
          ),
        ],
      ),
    );
  }

  Widget labelText({String label, String value}) {
    return Row(
      children: [
        Text(label),
        SizedBox(
          width: 80,
        ),
        Text(value),
      ],
    );
  }

  Widget header(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/user.png',
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        SizedBox(width: 8),
        Text(
          person.name,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Widget button({String buttonName, Color color, void onpress}) {
    return TextButton(
      onPressed: () => onpress,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(
        buttonName,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}