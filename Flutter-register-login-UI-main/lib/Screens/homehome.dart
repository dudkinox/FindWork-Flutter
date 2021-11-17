// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/Screens/alertPage/alertPage.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/profile/Profile.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/notification.dart';
import 'package:login_ui/model/loginModel.dart';
import 'favorite/favorite.dart';

class HomeHome extends StatefulWidget {
  HomeHome(this.newindex, this.token, this.typeUser, this.matching);
  var token;
  var typeUser;
  var matching;
  int newindex;
  @override
  _HomeHomeState createState() =>
      _HomeHomeState(newindex, token, typeUser, matching);
}

class _HomeHomeState extends State<HomeHome> {
  _HomeHomeState(this.newindex, this.token, this.typeUser, this.matching);
  var token;
  var typeUser;
  var matching;
  int newindex;
  bool loading = false;

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  Future<void> clearNotification() async {
    await FlutterSession().set('notification', 0);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingCube()
        : FutureBuilder(
            future: FlutterSession().get('notification'),
            builder: (context, snapshot) {
              if (snapshot.data == 1) {
                MessageNotification();
                clearNotification();
              }
              return RefreshIndicator(
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
                          ? HomePage(newindex, token, typeUser, matching)
                          : newindex == 1
                              ? ProfilePage(typeUser, token, matching)
                              : newindex == 2
                                  ? Favorite(token, typeUser)
                                  : newindex == 3
                                      ? AlertPage(token)
                                      : null,
                    ),
                  ));
            });
  }
}
