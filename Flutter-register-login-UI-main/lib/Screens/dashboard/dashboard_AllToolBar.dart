import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';

import '../homehome.dart';
import 'dashboard_itemCard.dart';

class dashboard_AllFulltime extends StatefulWidget {
  @override
  _dashboard_AllFulltimeState createState() => _dashboard_AllFulltimeState();
}

// final List<String> _listItem = [
//   'assets/images/two.jpg',
//   'assets/images/three.jpg',
//   'assets/images/four.jpg',
// ];

class _dashboard_AllFulltimeState extends State<dashboard_AllFulltime> {
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeHome(0))),
            },
          ),
          actions: [
            // IconButton(
            //   icon: Icon(Icons.filter_list, color: Colors.black),
            //   onPressed: () {},
            // ),
            const SizedBox(width: 4),
          ],
        ),
        body: TabBarView(children: [
          dashboard_itemCard(),
        ]),
        // body: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       Expanded(
        //           child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: kDefaultPadding),
        //               child: GridView.builder(
        //                 itemCount: products.length,
        //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     mainAxisSpacing: kDefaultPadding,
        //                     crossAxisSpacing: kDefaultPadding,
        //                     childAspectRatio: 0.75),
        //                 itemBuilder: (context, index) => GestureDetector(
        //                   child: dashboard_itemCard(
        //                     product: products[index],
        //                   ),
        //                   // onTap: () => Navigator.push(
        //                   //     context,
        //                   //     MaterialPageRoute(
        //                   //         builder: (context) =>
        //                   //             DetailsPage(product: products[index]))),
        //                 ),
        //               )))
        //     ]),
      ),
    );
  }
}
