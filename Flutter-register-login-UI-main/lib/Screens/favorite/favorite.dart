import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Stream favStream;
  Stream profileStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          StreamBuilder(
              stream: profileStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 13),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              NetworkImage(snapshot.data.data()["img"]),
                          backgroundColor: Colors.white54,
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width: 15,
                            height: 15,
                          ),
                        ),
                      );
              })
        ],
      ),
      body: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 15,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Favorites',
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
