import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/alertPage/alertPage.dart';
import 'package:login_ui/Screens/favorite/favorite.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Screens/profile/Profile.dart';

class HomeHome extends StatefulWidget {
  @override
  _HomeHomeState createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  int newindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF481E95),
        index: 0,
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 30.0,
          ),
          Icon(
            Icons.add_alert_outlined,
            color: Colors.white,
            size: 30.0,
          ),
        ],
        onTap: (index) {
          setState(() {
            newindex = index;
          });
        },
      ),
      body: newindex == 0
          ? HomePage()
          : newindex == 1
              ? ProfilePage()
              : newindex == 2
                  ? Favorite()
                  : newindex == 3
                      ? AlertPage()
                      : null,
    );
  }
}
