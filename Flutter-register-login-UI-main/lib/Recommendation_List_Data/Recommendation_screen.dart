import 'package:flutter/material.dart';
import 'package:login_ui/details_screen.dart';

List RecommendationList = [
  Recommendation(
      "https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801__480.jpg",
      "Sleman, Yogyakarta"),
  Recommendation(
      "https://cdn.pixabay.com/photo/2016/11/19/16/46/architecture-1840263__480.jpg",
      "Berlin, Germany"),
  Recommendation(
      "https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801__480.jpg",
      "Sleman, Yogyakarta"),
];

class Recommendation extends StatelessWidget {
  final String imgUlr;
  final String location;

  const Recommendation(this.imgUlr, this.location);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DetailsPage(imgUlr),
              ),
            );
          },
          child: Container(
            height: 370.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 250.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(imgUlr), fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " Happiness Cafe Roastery",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                location,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    "4(24 Review)",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Text(
                                "Detail >",
                                style: TextStyle(
                                  color: Colors.teal,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
