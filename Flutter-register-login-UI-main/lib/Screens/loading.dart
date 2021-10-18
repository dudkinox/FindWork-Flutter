import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> aniamtion_rotaion;
  Animation<double> aniamtion_radius_in;
  Animation<double> aniamtion_radius_out;

  final double initialRadius = 30.0;

  double radius = 0.0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    
    aniamtion_rotaion = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0 , 1.0, curve: Curves.linear)));

    aniamtion_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );
    aniamtion_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {

      setState(() {
        if(controller.value >= 0.75 && controller.value <= 1.0){
          radius = aniamtion_radius_in.value * initialRadius;
        } else if(controller.value >= 0.0 && controller.value <= 0.25){
          radius = aniamtion_radius_out.value * initialRadius;
        }
      });

    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: aniamtion_rotaion,
          child: Stack(
            children: [
              Dot(
                radius: 30.0,
                color: Colors.black12,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(3 * pi/4), radius * sin(3 * pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(4 * pi/4), radius * sin(4 * pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(5 * pi/4), radius * sin(5 * pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(6 * pi/4), radius * sin(6 * pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(7 * pi/4), radius * sin(7 * pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(8 * pi/4), radius * sin(8 * pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.blue[300],
          size: 50.0,
        ),
      ),
    );
  }
}