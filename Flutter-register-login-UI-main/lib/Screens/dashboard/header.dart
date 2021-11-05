// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/profile/Profile.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/Themes/images.dart';

class Header extends StatelessWidget {
  Header(this.token);
  var token;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.0,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.rotate(
                angle: 180 * pi / 180,
                child: IconButton(
                  iconSize: 40,
                  color: PrimaryColor,
                  icon: const Icon(Icons.exit_to_app_rounded),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                )),
            // IconButton(icon: Icon(null), onPressed: () {}),
            Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[900].withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(profileICON),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProfilePage()));
                      },
                      child: null,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
