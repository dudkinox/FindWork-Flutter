import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Animation/Fade_Animation.dart';
import 'Themes/Themes.dart';

class DetailsPage extends StatelessWidget {
  final String imgUrl;

  const DetailsPage(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                1.0,
                Container(
                  height: 350.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(imgUrl), fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 160.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(.5),
                          ),
                          child: Icon(Icons.date_range_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeAnimation(
                1.1,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " คาเฟ่ทดสอบ",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: PrimaryColor),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: PrimaryColor,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "จันทรเกษม....",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(),
                          Text(
                            "\฿ 50/ชั่วโมง",
                            style: TextStyle(
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "สิ่งอำนวยความสะดวก",
                        style: TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Container(
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Row(
                          children: [
                            FacilitiesChild(
                                Icon(
                                  Icons.wifi,
                                  color: Colors.white,
                                ),
                                "Wifi"),
                            FacilitiesChild(
                                Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                ),
                                "AC"),
                            FacilitiesChild(
                                Icon(
                                  Icons.wash_outlined,
                                  color: Colors.white,
                                ),
                                "สุขอนามัย"),
                            FacilitiesChild(
                                Icon(
                                  Icons.audiotrack_outlined,
                                  color: Colors.white,
                                ),
                                "เพลง"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "เมนูทั้งหมด",
                        style: TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เมนูยอดนิยม",
                            style: TextStyle(
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          Text(
                            "ดูทั้งหมด",
                            style: TextStyle(
                              color: PrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 250.0,
                        width: double.infinity,
                        // color: Colors.red,
                        child: ListView(
                          children: [
                            PopularMenu(
                                "https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894__480.jpg"),
                            PopularMenu(
                                "https://cdn.pixabay.com/photo/2016/09/01/22/43/coffee-1637907__480.jpg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget PopularMenu(String imgUrl) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20.0),
    child: Container(
      height: 120.0,
      width: double.infinity,
      // color: Colors.bull,
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Icon(
                Icons.date_range_outlined,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            height: 120.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: NetworkImage(imgUrl), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ไอศครีม",
                      style: TextStyle(
                          color: PrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                    Text(
                      "ไอศครีมสองรสชาติ",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\฿ 25",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        Container(
                          height: 30.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "สมัครตอนนี้",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget FacilitiesChild(
  Icon icon,
  String title,
) {
  return Padding(
    padding: EdgeInsets.only(left: 6.0),
    child: Container(
      height: 40.0,
      width: 90.0,
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 3.0,
          ),
          Text(title),
        ],
      ),
    ),
  );
}
