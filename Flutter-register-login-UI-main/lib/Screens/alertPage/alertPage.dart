import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/home_screen.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/background.dart';

import 'infinite.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('แจ้งเตือน'),
            backgroundColor: PrimaryColor,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  _infiniteController.animateTo(
                      _infiniteController.offset + 2000.0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_upward),
                onPressed: () {
                  _infiniteController.animateTo(
                      _infiniteController.offset - 2000.0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                },
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'การตอบกลับ'),
                Tab(text: 'ข้อความ'),
              ],
            ),
          ),
          body: FadeAnimation(
            1.0,
            TabBarView(
              children: <Widget>[
                _buildTab(0),
                _buildTab(1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('แจ้งเตือน ข้อความที่ $index'),
              subtitle: Text('การตอบกลับที่ $index'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 2.0),
      anchor: 0.5,
    );
  }
}

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();

  bool backButton = backbuttonpressedTime == null ||
      currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

  if (backButton) {
    backbuttonpressedTime = currentTime;
    Fluttertoast.showToast(
        msg: "กดอีกครั้งเพื่อออก!!",
        backgroundColor: Colors.black,
        textColor: Colors.white);
    return false;
  }
  return true;
}