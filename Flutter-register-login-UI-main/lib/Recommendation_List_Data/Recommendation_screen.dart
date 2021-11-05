import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/details_screen.dart';
import 'package:login_ui/model/favoriteModel.dart';
import 'package:login_ui/model/jobModel.dart';


class Recommendation extends StatefulWidget {
  final String imgUlr;
  final String location;
  final String company;
  final String id;
  final String token;

  const Recommendation(this.imgUlr, this.company, this.location, this.id, this.token);
  @override
  _RecommendationState createState() => _RecommendationState(imgUlr,company,location,id,token);
}

class _RecommendationState extends State<Recommendation> {
_RecommendationState(this.imgUlr, this.company, this.location, this.id, this.token);
var imgUlr;
var company;
var location;
var id;
var token;

Future<bool> status(String token, String jobId) async {
    FavoriteModel status = await GetFavorite(token);
    if(status != null){
      for (var i = 0; i < status.jobId.length; i++) {
        if (status.jobId[i] == null) {
          return false;
        }
        if (status.jobId[i] == jobId) {
          return true;
        }
      }
    }
      return false;
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<JobDataModel>>(
        future: TopicWork(),
        builder: (context, AsyncSnapshot snapshot) {
          JobDataModel data = new JobDataModel();
          if (snapshot?.connectionState != ConnectionState.done) {
            return LoadingFadingCube();
          } else {
            for (var item in snapshot?.data) {
              data?.company = item.company;
              data?.departmentId = item.departmentId;
              data?.district = item.district;
              data?.id = item.id;
              data?.image = item.image;
              data?.jobId = item.jobId;
              data?.province = item.province;
              data?.subDistrict = item.subDistrict;
            }
            return Padding(
              padding: EdgeInsets.only(top: 20.0, left: 15, right: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DetailsPage(imgUlr, id, token),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                
                                image: DecorationImage(
                                    image: NetworkImage(imgUlr),
                                    fit: BoxFit.cover),
                                    
                              ),
                              child: 
                              Stack(
                                children: [
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: FutureBuilder<bool>(
                                  future: status(token, id),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    bool favorite = snapshot?.data;
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return Text("");
                                    } else {
                                      return FavoriteButton(
                                        isFavorite: favorite,
                                        valueChanged: (_isFavorite) {
                                          if (_isFavorite == true) {
                                            AddFavorite(id, token);
                                          } else {
                                            DelFavorite(id, token);                                              
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),)],)
                              
                              
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
                                  company,
                                  style: TextStyle(
                                      color: PrimaryColor,
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
                                      color: PrimaryColor,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      location,
                                      style: TextStyle(
                                          color: PrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: PrimaryColor,
                                        ),
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          data.departmentId.status[0] == true
                                              ? 'มีตำแหน่งงานเปิดรับอยู่'
                                              : data.departmentId.status[0] ==
                                                      false
                                                  ? 'ไม่มีตำแหน่งเปิดรับสมัครแล้ว'
                                                  : '',
                                          style: TextStyle(
                                              color: PrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "รายละเอียด >",
                                      style: TextStyle(
                                        color: PrimaryColor,
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
            );
          }
        },
      ),
    );
  }
}
