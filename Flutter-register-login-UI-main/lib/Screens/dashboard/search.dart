import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Themes/Themes.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.2,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
            cursorColor: PrimaryColor,
            decoration: InputDecoration(
              fillColor: PrimaryColor,
              prefixIcon: Icon(
                Icons.search,
                color: PrimaryColor,
              ),
              hintText: "ค้นหาที่นี่",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: PrimaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: PrimaryColor),
              ),
            )),
      ),
    );
  }
}
