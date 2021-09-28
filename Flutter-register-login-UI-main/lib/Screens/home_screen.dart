import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';

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
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xFF481E95), width: 2.0),
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
                            color: Color(0xFF481E95),
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
                      cursorColor: Color(0xFF481E95),
                      decoration: InputDecoration(
                        fillColor: Color(0xFF481E95),
                        suffixIcon: Icon(
                          Icons.filter_list,
                          color: Color(0xFF481E95),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF481E95),
                        ),
                        hintText: "ค้นหาที่นี่",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Color(0xFF481E95)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Color(0xFF481E95)),
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
                  color: Color(0xFF481E95),
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: TabBar(
                          labelColor: Color(0xFF481E95),
                          indicatorColor: Color(0xFF481E95),
                          unselectedLabelColor: Color(0xFF481E95),
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
                                                color: Color(0xFF481E95),
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
                                          color: Color(0xFF481E95),
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
                                                color: Color(0xFF481E95),
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
                                          color: Color(0xFF481E95),
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
                                                color: Color(0xFF481E95),
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
                                          color: Color(0xFF481E95),
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
          color: Color(0xFF481E95),
        ),
        Text("Bar", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
