import 'package:flutter/material.dart';
import 'package:login_ui/Screens/alertPage/infinite.dart';
import 'package:login_ui/ScreensAddjob/HomeAddjob.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'manageJob.dart';

class HomeAdmin extends StatefulWidget {
  HomeAdmin(this.token);
  var token;

  @override
  _HomeAdminState createState() => _HomeAdminState(token);
}

class _HomeAdminState extends State<HomeAdmin> {
  _HomeAdminState(this.token);
  var token;
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeAddjob(token)),
              );
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
            Manager(),
          ],
        ),
      ),
    );
  }
}
