// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/dashboard/welcome.dart';
import 'package:login_ui/Screens/dashboard/work.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';

import 'dashboard/header.dart';
import 'dashboard/search.dart';

DateTime backbuttonpressedTime;

class HomePage extends StatelessWidget {
  TextEditingController fullname = TextEditingController();
  String token = "";
  HomePage(this.newindex,this.id_token);
  var id_token;
  int newindex;
  bool loading = false;
  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
                    Header(id_token),
                    SizedBox(
                      height: 20.0,
                    ),
                    Welcome(token, fullname),
                    SizedBox(
                      height: 20.0,
                    ),
                    Search(),
                    SizedBox(
                      height: 15.0,
                    ),
                    Work(id_token),
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
