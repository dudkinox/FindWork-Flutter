// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/alertPage/infinite.dart';
import 'package:login_ui/ScreensAddjob/HomeAddjob.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'manageJob.dart';

class HomeAdmin extends StatefulWidget {
  HomeAdmin(this.token, this.typeUser, this.id_job, this.name_job);
  var token;
  var typeUser;
  var id_job;
  var name_job;
  @override
  _HomeAdminState createState() =>
      _HomeAdminState(token, typeUser, id_job, name_job);
}

class _HomeAdminState extends State<HomeAdmin> {
  _HomeAdminState(this.token, this.typeUser, this.id_job, this.name_job);
  var token;
  var typeUser;
  var id_job;
  var name_job;
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HomeAddjob(token, typeUser)));
              },
            ),
            title: const Text('หน้าจัดการผู้สมัคร'),
            centerTitle: true,
            backgroundColor: HeaderColor,
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'จัดการผู้ใช้'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Manager(id_job, name_job, token),
            ],
          ),
        ),
      ),
    );
  }
}
