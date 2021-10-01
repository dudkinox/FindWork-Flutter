import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Themes/Themes.dart';

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
                      IconButton(icon: Icon(null), onPressed: () {}),
                      Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: PrimaryColor, width: 2.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://img.icons8.com/ios-glyphs/64/000000/user.png"),
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
                        "สวัสดี, เบล!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "คุณต้องการค้นหางานที่ไหน?!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: PrimaryColor,
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
                      cursorColor: PrimaryColor,
                      decoration: InputDecoration(
                        fillColor: PrimaryColor,
                        suffixIcon: Icon(
                          Icons.filter_list,
                          color: PrimaryColor,
                        ),
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
              ),
              SizedBox(
                height: 15.0,
              ),
              FadeAnimation(
                1.2,
                Container(
                  height: 610.0,
                  width: double.infinity,
                  color: PrimaryColor,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: TabBar(
                          labelColor: PrimaryColor,
                          indicatorColor: PrimaryColor,
                          unselectedLabelColor: PrimaryColor,
                          tabs: [
                            Tab(
                              icon: Icon(Icons.home_work_outlined),
                              text: "งานประจำ",
                            ),
                            Tab(
                              icon: Icon(Icons.home_work_rounded),
                              text: "พาร์ทไทม์",
                            ),
                            Tab(
                              icon: Icon(Icons.favorite_border),
                              text: "ชื่นชอบ",
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
                                            "คำแนะนำ",
                                            style: TextStyle(
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "งานที่คุณอาจชอบ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "ดูทั้งหมด",
                                        style: TextStyle(
                                          color: PrimaryColor,
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
                                            "คำแนะนำ",
                                            style: TextStyle(
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "งานที่คุณอาจชอบ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "ดูทั้งหมด",
                                        style: TextStyle(
                                          color: PrimaryColor,
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
                                            "คำแนะนำ",
                                            style: TextStyle(
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "งานที่คุณอาจชอบ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "ดูทั้งหมด",
                                        style: TextStyle(
                                          color: PrimaryColor,
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
          color: PrimaryColor,
        ),
        Text("Bar", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
