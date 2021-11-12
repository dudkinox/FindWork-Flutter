import 'package:flutter/material.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/image.dart';

class showResume extends StatefulWidget {
  @override
  _showResumeState createState() => _showResumeState();
}

class _showResumeState extends State<showResume> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(
              "เรซูเม่",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: PrimaryColor,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(DefaultImage),
                  fit: BoxFit.cover,
                ),
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
