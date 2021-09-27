import 'package:find_a_job_flutter_app/Animation/Fade_Animation.dart';
import 'package:find_a_job_flutter_app/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              FadeAnimation(
                1.0,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                      Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            //color: Colors.blue,
                            child: Stack(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.add_alert_outlined),
                                    onPressed: () {}),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 22.0, top: 11.0),
                                  child: Container(
                                    height: 5.0,
                                    width: 5.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.orange, width: 2.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://avatars.githubusercontent.com/u/56843071?v=4"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeAnimation(
                1.1,
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Hakkı!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Where today you'll work?!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FadeAnimation(
                1.2,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        fillColor: Colors.orange,
                        suffixIcon: Icon(
                          Icons.filter_list,
                          color: Colors.orange,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),
                        hintText: "Or search coworking here",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              FadeAnimation(
                1.2,
                Container(
                  height: 610.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: TabBar(
                          labelColor: Colors.orange,
                          indicatorColor: Colors.orange,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(
                              icon: Icon(Icons.wine_bar),
                              text: "Bar",
                            ),
                            Tab(
                              icon: Icon(Icons.home_work_outlined),
                              text: "Office",
                            ),
                            Tab(
                              icon: Icon(Icons.home_work_rounded),
                              text: "Space",
                            ),
                          ]),
                      body: TabBarView(children: [
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Recommendation",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "These cafe are might you like it",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  SizedBox(height: 10.0,),
                                Container(
                                    height: 400.0,
                                    width: 400.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: RecommendationList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendationList[index];
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Recommendation",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "These cafe are might you like it",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  SizedBox(height: 10.0,),
                                Container(
                                    height: 400.0,
                                    width: 400.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: RecommendationList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendationList[index];
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Recommendation",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "These cafe are might you like it",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  SizedBox(height: 10.0,),
                                Container(
                                    height: 400.0,
                                    width: 400.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: RecommendationList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendationList[index];
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget childCetegory() {
  return Container(
    height: 40.0,
    width: 120.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
            color: Colors.deepOrangeAccent.withOpacity(.6),
            offset: Offset(0.0, 4.0)),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wine_bar,
          color: Colors.white,
        ),
        Text("Bar", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
