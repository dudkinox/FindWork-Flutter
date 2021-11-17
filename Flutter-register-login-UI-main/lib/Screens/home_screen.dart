// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/dashboard/welcome.dart';
import 'package:login_ui/Screens/dashboard/work.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/notification.dart';

import 'dashboard/header.dart';
import 'dashboard/search.dart';

DateTime backbuttonpressedTime;

class HomePage extends StatelessWidget {
  TextEditingController fullname = TextEditingController();
  HomePage(this.newindex, this.id_token, this.typeUser, this.matching);
  var id_token;
  var typeUser;
  var matching;
  int newindex;
  bool loading = false;
  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    MessageNotification();
    return loading
        ? Loader()
        : WillPopScope(
            onWillPop: onWillPop,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Header(id_token, typeUser, matching),
                    SizedBox(
                      height: 20.0,
                    ),
                    Welcome(id_token, fullname),
                    SizedBox(
                      height: 20.0,
                    ),
                    Search(id_token, typeUser),
                    SizedBox(
                      height: 15.0,
                    ),
                    Work(id_token, typeUser, matching),
                  ],
                ),
              ),
            ),
          );
  }
}

Widget childCetegory() {
  return Container(
    height: 40.0,
    width: 120.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
            color: Colors.deepOrangeAccent.withOpacity(.6),
            offset: Offset(0.0, 4.0)),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wine_bar,
          color: PrimaryColor,
        ),
        Text("Bar", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
