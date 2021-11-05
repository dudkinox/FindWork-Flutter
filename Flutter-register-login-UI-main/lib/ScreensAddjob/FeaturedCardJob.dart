import 'package:flutter/material.dart';

import 'package:login_ui/Themes/Themes.dart';

import 'DetailCardJob.dart';
import 'EditingCardJob.dart';

class FeaturedCardJob extends StatelessWidget {
  final featuredJobs;
  final token;
  final typeUser;
  final VoidCallback onClicked;

  const FeaturedCardJob(
      {this.featuredJobs, this.typeUser, this.token, this.onClicked, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DetailCardJob(typeUser, token)));
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all((4)),
                  width: (70),
                  height: (50),
                  child: Image.asset(
                    featuredJobs.image,
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featuredJobs.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      featuredJobs.subTitle,
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
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditingCardJob()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
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
                                      padding: const EdgeInsets.only(left: 10),
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
                buildChip(featuredJobs.text1),
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
                  featuredJobs.renumeration,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(featuredJobs.datePosted)
              ],
            ),
          ],
        ),
      ),
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
