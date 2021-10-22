import 'package:flutter/material.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Themes/Themes.dart';

class dashboard_itemCard extends StatelessWidget {
  final product;

  const dashboard_itemCard({this.product});

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              width: MediaQuery.of(context).size.width * 3.5,
              child: Container(
                decoration: BoxDecoration(
                  // color: PrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: AssetImage(products[0].image), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              child: Text("${demoFeatured[0].title}",
                  style: TextStyle(color: SecondaryColor))),
          Text(
            "\$ ${demoFeatured[0].subTitle}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
