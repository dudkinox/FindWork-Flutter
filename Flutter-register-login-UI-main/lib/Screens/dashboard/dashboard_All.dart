// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';

import '../homehome.dart';
import 'dashboard_itemCard.dart';

class dashboard_All extends StatefulWidget {
  dashboard_All(this.token, this.typeUser);
  var token;
  var typeUser;
  @override
  _dashboard_AllState createState() => _dashboard_AllState(token, typeUser);
}

class _dashboard_AllState extends State<dashboard_All> {
  _dashboard_AllState(this.token, this.typeUser);
  var token;
  var typeUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "งานประจำ",
            style: TextStyle(
              color: SecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomeHome(0, token, typeUser))),
            },
          ),
        ),
        body: Container(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            itemCount: demoFeatured.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.75),
            itemBuilder: (context, index) => GestureDetector(
              child: dashboard_itemCard(
                product: demoFeatured[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
