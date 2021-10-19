import 'package:flutter/material.dart';

import 'package:login_ui/Themes/Themes.dart';

import 'JobJob.dart';

class FeaturedCard extends StatelessWidget {
  final featuredJobs;

  const FeaturedCard({this.featuredJobs});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => JobJob()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        margin: EdgeInsets.symmetric(horizontal: (10)),
        width: 350,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: PrimaryColor),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      featuredJobs.subTitle,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: (30),
                  height: (30),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ButtonColor),
                )
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
            )
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
