import 'package:flutter/material.dart';
import 'package:login_ui/Themes/Themes.dart';

class notFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Text(
          "ไม่พบข้อมูล",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: PrimaryColor),
        )
      ],
    ));
  }
}
