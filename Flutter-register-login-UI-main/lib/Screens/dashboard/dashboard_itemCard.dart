import 'package:flutter/material.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Themes/Themes.dart';

class dashboard_itemCard extends StatelessWidget {
  final product;

  const dashboard_itemCard({this.product});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              height: 180.0,
              width: 160.0,
              child: Hero(
                  tag: demoFeatured[0].title,
                  child: Image.asset(demoFeatured[0].image)),
              decoration: BoxDecoration(
                  // color: product.color,
                  borderRadius: BorderRadius.circular(16.0))),
        ),
        // Padding(
        //     padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
        //     child: Text("${product.title}",
        //         style: TextStyle(color: kTextLightColor))),
        // Text(
        //   "\$ ${product.price}",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // )
      ],
    );
  }
}
