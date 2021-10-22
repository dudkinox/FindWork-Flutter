import 'package:flutter/material.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Themes/Themes.dart';

import 'dashboard_itemCard.dart';

class dashboard_All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: GridView.builder(
                itemCount: demoFeatured.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                    childAspectRatio: 0.75),
                itemBuilder: (context, index) => GestureDetector(
                  child: dashboard_itemCard(
                    product: demoFeatured[0],
                  ),
                  // onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailsPage(product: products[index]))),
                ),
              )))
    ]);
  }
}
