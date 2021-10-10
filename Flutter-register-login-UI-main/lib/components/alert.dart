// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AlertMessage extends StatelessWidget {
  AlertMessage(this.Title, this.DetailMessage, this.Path);
  String Title;
  String DetailMessage;
  var Path;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(Title),
      content: Text(DetailMessage),
      actions: [
        CupertinoDialogAction(
          onPressed: () => {
            if (Path != null)
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Path)),
              }
          },
          child: Text("ยอมรับ"),
        ),
      ],
    );
  }
}
