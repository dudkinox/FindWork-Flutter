import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import '../choices.dart' as choices;

class FeaturesModalFilter extends StatefulWidget {
  @override
  _FeaturesModalFilterState createState() => _FeaturesModalFilterState();
}

class _FeaturesModalFilterState extends State<FeaturesModalFilter> {
  String _car = '';
  List<String> _smartphone = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        SmartSelect<String>.single(
          title: 'Car',
          placeholder: 'Choose one',
          selectedValue: _car,
          onChange: (selected) => setState(() => _car = selected.value),
          choiceItems: S2Choice.listFrom<String, Map>(
            source: choices.cars,
            value: (index, item) => item['value'],
            title: (index, item) => item['title'],
            group: (index, item) => item['brand'],
          ),
          choiceGrouped: true,
          modalFilter: true,
          modalFilterAuto: true,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                ),
              ),
            );
          },
        ),
        const Divider(indent: 20),
        SmartSelect<String>.multiple(
          title: 'Smartphones',
          placeholder: 'Choose one',
          selectedValue: _smartphone,
          onChange: (selected) {
            setState(() => _smartphone = selected.value);
          },
          choiceItems: S2Choice.listFrom<String, Map>(
            source: choices.smartphones,
            value: (index, item) => item['id'],
            title: (index, item) => item['name'],
            group: (index, item) => item['category'],
          ),
          choiceGrouped: true,
          modalType: S2ModalType.bottomSheet,
          modalFilter: true,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/xsGxhtAsfSA/100x100',
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
