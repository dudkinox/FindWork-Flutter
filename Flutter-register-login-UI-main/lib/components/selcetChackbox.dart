import 'package:flutter/material.dart';
import 'package:login_ui/SelectCheckbox/smart_select.dart';
import '../SelectCheckbox/choices.dart' as choices;

class FeaturesMultiChips extends StatefulWidget {
  @override
  _FeaturesMultiChipsState createState() => _FeaturesMultiChipsState();
}

class _FeaturesMultiChipsState extends State<FeaturesMultiChips> {
  List<String> _smartphone = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(indent: 20),
        SmartSelect<String>.multiple(
          title: 'งานที่สนใจ',
          selectedValue: _smartphone,
          onChange: (selected) {
            setState(() => _smartphone = selected.value);
          },
          choiceType: S2ChoiceType.chips,
          choiceItems: S2Choice.listFrom<String, Map>(
            source: choices.smartphones,
            value: (index, item) => item['id'],
            title: (index, item) => item['name'],
          ),
          choiceStyle: S2ChoiceStyle(outlined: true),
          choiceActiveStyle: S2ChoiceStyle(outlined: true),
          modalConfig: S2ModalConfig(
            type: S2ModalType.bottomSheet,
            useFilter: true,
            maxHeightFactor: .7,
          ),
          tileBuilder: (context, state) {
           
            return S2Tile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
      ],
    );
  }
}
