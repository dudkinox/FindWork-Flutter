// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AlertMessage extends StatelessWidget {
  AlertMessage(this.Title, this.DetailMessage);
  String Title;
  String DetailMessage;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(Title),
      content: Text(DetailMessage),
      actions: [
        CupertinoDialogAction(
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp())),
          },
          child: Text("ยอมรับ"),
        ),
      ],
    );
  }
}
