import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Themes/Themes.dart';

import 'package:login_ui/model/Search.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.2,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TypeAheadField(
          hideSuggestionsOnKeyboardHide: false,
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 14),
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
              leading: Icon(Icons.shopping_cart),
              title: Text(suggestion['name']),
              subtitle: Text('\$${suggestion['price']}'),
            );
          },
          onSuggestionSelected: (suggestion) {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ProductPage(product: suggestion)));
          },
        ),
      ),
    );
  }
}
