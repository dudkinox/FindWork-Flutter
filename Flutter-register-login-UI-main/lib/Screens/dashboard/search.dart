import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/SearchModel.dart';

import 'package:login_ui/model/jobModel.dart';

import '../../details_screen.dart';

class Search extends StatelessWidget {
  Search(this.token);
  var token;
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(user.image, user.id, token)));

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Selected user: ${user.company}'),
              ));
          },
          // child: FutureBuilder<List<JobDataModel>>(
          //   future: TopicWork(),
          //   builder: (context, AsyncSnapshot snapshot) {
          //     List result = [];
          //     if (snapshot?.connectionState != ConnectionState.done) {
          //       return LoadingCube();
          //     } else {
          //       return TypeAheadField(
          //         hideSuggestionsOnKeyboardHide: false,
          //         textFieldConfiguration: TextFieldConfiguration(
          //           autofocus: false,
          //           style:
          //               DefaultTextStyle.of(context).style.copyWith(fontSize: 14),
          //           decoration: InputDecoration(
          //               enabled: false,
          //               prefixIcon: Icon(Icons.search_outlined),
          //               enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(20.0),
          //                 borderSide: BorderSide(color: PrimaryColor),
          //               ),
          //               disabledBorder: OutlineInputBorder(
          //                   borderSide: BorderSide(color: PrimaryColor),
          //                   borderRadius: BorderRadius.circular(20.0)),
          //               hintText: 'ค้นหาที่นี้'),
          //         ),
          //         suggestionsCallback: (Pattern) async {
          //           return await BackendService.getSuggestions(Pattern);
          //         },
          //         itemBuilder: (context, suggestion) {
          //           return ListTile(
          //             title: Text(suggestion['company']),
          //             // subtitle: Text('\$${suggestion['price']}'),
          //           );
          //         },
          //         onSuggestionSelected: (suggestion) {
          //           // Navigator.of(context).push(MaterialPageRoute(
          //           //     builder: (context) => ProductPage(product: suggestion)));
          //         },
          //       );
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
