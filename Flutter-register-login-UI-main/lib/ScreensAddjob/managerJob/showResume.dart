import 'package:flutter/material.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/image.dart';

class showResume extends StatefulWidget {
  @override
  _showResumeState createState() => _showResumeState();
}

class _showResumeState extends State<showResume> {
  final double minScale = 1;
  final double maxScale = 4;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(
              "เรซูเม่",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: PrimaryColor,
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: InteractiveViewer(
                clipBehavior: Clip.none,
                panEnabled: false,
                minScale: minScale,
                maxScale: maxScale,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            "https://ichef.bbci.co.uk/news/800/cpsprodpb/1124F/production/_119932207_indifferentcatgettyimages.png",
                            fit: BoxFit.cover)))),
          ),
        ),
      ),
    );
  }
}
