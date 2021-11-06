// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/SearchModel.dart';
import '../../details_screen.dart';

class Search extends StatelessWidget {
  Search(this.token, this.typeUser);
  var token;
  var typeUser;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.2,
      Container(
        padding: EdgeInsets.all(16),
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
            final user = suggestion;

            return ListTile(
              title: Text(user.company),
            );
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(user.image, user.id, token, typeUser)));

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Selected user: ${user.company}'),
              ));
          },
        ),
      ),
    );
  }
}
