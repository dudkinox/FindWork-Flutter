import 'package:flutter/material.dart';

class JobJob extends StatelessWidget {
  final Jobs;

  JobJob({this.Jobs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          " job.company",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  // child: Image.asset(
                  //   Jobs.image,
                  //   fit: BoxFit.cover,
                  // ),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(Jobs.image),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              // Center(
              //   child: Text(
              //     job.position,
              //     style: TextStyle(
              //       fontSize: 32,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // Center(
              //   child: Text(
              //     job.city,
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 32,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         height: 45,
              //         decoration: BoxDecoration(
              //           color: Colors.grey[200],
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(10),
              //           ),
              //         ),
              //         child: Center(
              //           child: Text(
              //             job.concept,
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 16,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 32,
              //     ),
              //     Expanded(
              //       child: Container(
              //         height: 45,
              //         decoration: BoxDecoration(
              //           color: Colors.grey[200],
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(10),
              //           ),
              //         ),
              //         child: Center(
              //           child: Text(
              //             job.concept,
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 16,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 32,
              // ),
              // Row(
              //   children: [
              //     Text(
              //       r"$" + job.price + "/h",
              //       style: TextStyle(
              //         fontSize: 20,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 32,
              // ),
              // Text(
              //   "Requirements",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(
                height: 16,
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     physics: BouncingScrollPhysics(),
              //     child: Column(
              //       children: buildRequirements(),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // List<Widget> buildRequirements() {
  //   List<Widget> list = [];
  //   for (var i = 0; i < getJobsRequirements().length; i++) {
  //     list.add(buildRequirement(getJobsRequirements()[i]));
  //   }
  //   return list;
  // }

  // Widget buildRequirement(String requirement) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 8),
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 4,
  //           height: 4,
  //           decoration: BoxDecoration(
  //             color: Colors.grey,
  //             shape: BoxShape.circle,
  //           ),
  //         ),
  //         SizedBox(
  //           width: 16,
  //         ),
  //         Flexible(
  //           child: Text(
  //             requirement,
  //             style: TextStyle(
  //               fontSize: 14,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.grey,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
