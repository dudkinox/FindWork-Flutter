// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/Screens/alertPage/alertPage.dart';
import 'package:login_ui/Screens/favorite/favorite.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Screens/profile/Profile.dart';
import 'package:login_ui/Themes/Themes.dart';

class HomeHome extends StatefulWidget {
  HomeHome(this.newindex);
  int newindex;
  @override
  _HomeHomeState createState() => _HomeHomeState(newindex);
}

class _HomeHomeState extends State<HomeHome> {
  _HomeHomeState(this.newindex);
  int newindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: PrimaryColor,
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
          ? HomePage(newindex)
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
