import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';

import 'package:login_ui/model/Search.dart';
import 'package:login_ui/model/jobModel.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.2,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: FutureBuilder<List<JobDataModel>>(
          future: TopicWork(),
          builder: (context, AsyncSnapshot snapshot) {
            List result = [];
            if (snapshot?.connectionState != ConnectionState.done) {
              return LoadingCube();
            } else {
              return TypeAheadField(
                hideSuggestionsOnKeyboardHide: false,
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  style:
                      DefaultTextStyle.of(context).style.copyWith(fontSize: 14),
                  decoration: InputDecoration(
                      enabled: false,
                      prefixIcon: Icon(Icons.search_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: PrimaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: PrimaryColor),
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: 'ค้นหาที่นี้'),
                ),
                suggestionsCallback: (Pattern) async {
                  return await BackendService.getSuggestions(Pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion['name']),
                    subtitle: Text('\$${suggestion['price']}'),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => ProductPage(product: suggestion)));
                },
              );
            }
            ;
          },
        ),
      ),
    );
  }
}
