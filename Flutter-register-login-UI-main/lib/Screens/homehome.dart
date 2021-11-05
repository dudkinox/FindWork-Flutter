// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/alertPage/alertPage.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/profile/Profile.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'favorite/favorite.dart';

class HomeHome extends StatefulWidget {
  HomeHome(this.newindex, this.token);
  var token;
  int newindex;
  @override
  _HomeHomeState createState() => _HomeHomeState(newindex, token);
}

class _HomeHomeState extends State<HomeHome> {
  _HomeHomeState(this.newindex, this.token);
  var token;
  int newindex;
  bool loading = false;

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingCube()
        : RefreshIndicator(
            onRefresh: onPullToRefresh,
            child: WillPopScope(
              onWillPop: onWillPop,
              child: Scaffold(
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
                    ? HomePage(newindex, token)
                    : newindex == 1
                        ? ProfilePage()
                        : newindex == 2
                            ? Favorite(token)
                            : newindex == 3
                                ? AlertPage()
                                : null,
              ),
            ),
          );
  }
}
