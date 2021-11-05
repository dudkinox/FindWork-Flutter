// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => Path))
              }
              
            else
              {
                Navigator.pop(context),
              },
          },
          child: Text("ยอมรับ"),
        ),
      ],
    );
  }
}
