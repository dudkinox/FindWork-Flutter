import 'package:flutter/material.dart';
import 'package:login_ui/ScreensAddjob/managerJob/managelistdata.dart';
import 'manageCard.dart';


class Manager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Itemcard(person: users[index]),
          );
        },
      ),
    );
  }
}