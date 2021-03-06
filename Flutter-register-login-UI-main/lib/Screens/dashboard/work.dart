// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/dashboard/work_fulltime.dart';
import 'package:login_ui/Screens/dashboard/work_parttime.dart';
import 'package:login_ui/Themes/Themes.dart';

import 'work_progress.dart';

class Work extends StatelessWidget {
  Work(this.token, this.typeUser, this.matching);
  var token;
  var typeUser;
  var matching;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.2,
      Container(
        height: 610.0,
        width: double.infinity,
        color: PrimaryColor,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: TabBar(
                labelColor: PrimaryColor,
                indicatorColor: PrimaryColor,
                unselectedLabelColor: PrimaryColor,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_work_outlined),
                    text: "งานประจำ",
                  ),
                  Tab(
                    icon: Icon(Icons.home_work_rounded),
                    text: "พาร์ทไทม์",
                  ),
                  Tab(
                    icon: Icon(Icons.add_task),
                    text: "ที่กำลังสมัคร",
                  ),
                ]),
            body: TabBarView(children: [
              work_fulltime(token, typeUser, matching),
              work_parttime(token, typeUser, matching),
              work_progress(token, typeUser),
            ]),
          ),
        ),
      ),
    );
  }
}
