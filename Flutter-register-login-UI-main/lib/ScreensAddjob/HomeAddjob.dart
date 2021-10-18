import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/ScreensAddjob/detailJob.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';

class HomeAddjob extends StatelessWidget {
  final String imgUrl;

  const HomeAddjob(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  1.0,
                  Container(
                    height: 350.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.matichon.co.th%2Flifestyle%2Fnews_2916482&psig=AOvVaw3S9Bsn-Qez3zeaScwl_iOR&ust=1634221433947000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjfpbLLx_MCFQAAAAAdAAAAABAD"),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: 160.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white.withOpacity(.5),
                              ),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: Icon(Icons.settings_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1.1,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ชื่อบริษัท",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: PrimaryColor,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "จันทรเกษม....",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
    
                        SizedBox(
                          height: 10.0,
                        ),
    
                        Container(
                          height: 300.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "ข้อมูลบริษัท",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      children: buildRequirements(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 300.0,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey[300],
                        //     borderRadius: BorderRadius.circular(40.0),
                        //   ),
                        //   child: Padding(
                        //     padding: EdgeInsets.only(
                        //         bottom: 160.0,
                        //         left: 20.0,
                        //         right: 20.0,
                        //         top: 10.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         FacilitiesChild(
                        //             Icon(
                        //               Icons.wifi,
                        //               color: Colors.white,
                        //             ),
                        //             "Wifi"),
                        //         FacilitiesChild(
                        //             Icon(
                        //               Icons.ac_unit,
                        //               color: Colors.white,
                        //             ),
                        //             "AC"),
                        //         FacilitiesChild(
                        //             Icon(
                        //               Icons.wash_outlined,
                        //               color: Colors.white,
                        //             ),
                        //             "สุขอนามัย"),
                        //         FacilitiesChild(
                        //             Icon(
                        //               Icons.audiotrack_outlined,
                        //               color: Colors.white,
                        //             ),
                        //             "เพลง"),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 15.0,
                        // ),
                        // Text(
                        //   "งานทั้งหมด",
                        //   style: TextStyle(
                        //       color: PrimaryColor,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 20.0),
                        // ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "งานทั้งหมด",
                              style: TextStyle(
                                  color: PrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            Text(
                              "รายชื่อผู้สมัคร",
                              style: TextStyle(
                                color: PrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
    
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              demoFeatured.length,
                              (HomeAddjob) => FeaturedCard(
                                featuredJobs: demoFeatured[HomeAddjob],
                              ),
                            ),
                          ),
                        ),
    
                        // color: Colors.red,
                        // child: ListView(
                        //   children: [
    
                        //     PopularMenu(
                        //         "https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894__480.jpg"),
                        //     PopularMenu(
                        //         "https://cdn.pixabay.com/photo/2016/09/01/22/43/coffee-1637907__480.jpg"),
                        //   ],
                        // ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget PopularMenu(String imgUrl) {
//   return Padding(
//     padding: EdgeInsets.only(bottom: 20.0),
//     child: Container(
//       height: 120.0,
//       width: double.infinity,
//       // color: Colors.bull,
//       child: Row(
//         children: [
//           Container(
//             height: 120.0,
//             width: 80.0,
//             decoration: BoxDecoration(
//               color: PrimaryColor,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.date_range_outlined,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           Container(
//             height: 120.0,
//             width: 300.0,
//             decoration: BoxDecoration(
//               color: Colors.grey.withOpacity(.2),
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Container(
//                   height: 100.0,
//                   width: 100.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.0),
//                     image: DecorationImage(
//                         image: NetworkImage(imgUrl), fit: BoxFit.cover),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5.0,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "ไอศครีม",
//                       style: TextStyle(
//                           color: PrimaryColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0),
//                     ),
//                     Text(
//                       "ไอศครีมสองรสชาติ",
//                       style: TextStyle(color: Colors.grey, fontSize: 16.0),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "\฿ 25",
//                           style: TextStyle(
//                               color: Colors.teal,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.0),
//                         ),
//                         Container(
//                           height: 30.0,
//                           width: 100.0,
//                           decoration: BoxDecoration(
//                             color: PrimaryColor,
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(20.0),
//                               topRight: Radius.circular(20.0),
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "สมัครตอนนี้",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

List<Widget> buildRequirements() {
  List<Widget> list = [];
  for (var i = 0; i < getJobsRequirements().length; i++) {
    list.add(buildRequirement(getJobsRequirements()[i]));
  }
  return list;
}

Widget buildRequirement(String requirement) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            requirement,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}





// Widget FacilitiesChild(
//   Icon icon,
//   String title,
// ) {
//   return Padding(
//     padding: EdgeInsets.only(left: 6.0),
//     child: Container(
//       height: 40.0,
//       width: 90.0,
//       decoration: BoxDecoration(
//         color: PrimaryColor,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           icon,
//           SizedBox(
//             width: 3.0,
//           ),
//           Text(title),
//         ],
//       ),
//     ),
//   );
// }



