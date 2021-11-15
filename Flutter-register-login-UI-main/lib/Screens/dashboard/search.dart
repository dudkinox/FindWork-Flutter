// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/dashboard/mapjob.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/image.dart';
import 'package:login_ui/model/SearchModel.dart';
import '../../details_screen.dart';

class Search extends StatelessWidget {
  Search(this.token, this.typeUser);
  var token;
  var typeUser;
  var img;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FadeAnimation(
        1.2,
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 90,
                child: TypeAheadField<User>(
                  hideSuggestionsOnKeyboardHide: false,
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: PrimaryColor),
                      ),
                      hintText: 'ค้นหาที่นี่',
                    ),
                  ),
                  suggestionsCallback: UserApi.getUserSuggestions,
                  itemBuilder: (context, User suggestion) {
                    var temp;
                    if (suggestion?.company != "") {
                      temp = ListTile(
                        title: Text(suggestion?.company),
                      );
                    } else {
                      temp = Container(child: null);
                    }
                    return temp;
                  },
                  noItemsFoundBuilder: (context) => Container(
                    height: 60,
                    child: Center(
                      child: Text(
                        'ค้าหาไม่เจอ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (User suggestion) {
                    final user = suggestion;
                    if (user?.image == "") {
                      img = DefaultImage;
                    } else {
                      img = user?.image;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(img, user.id, token, typeUser)));

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: Text('เลือกบริษัท: ${user.company}'),
                      ));
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MapJob(token , typeUser)));
                },
                icon: Icon(Icons.location_on_outlined, color: PrimaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
