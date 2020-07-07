import 'package:flutter/material.dart';

import 'package:justnotes/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:justnotes/grid_state.dart';
import 'package:justnotes/default_grid_config.dart';

class KeyTypeSelector extends StatefulWidget {

  @override
  KeyTypeSelectorState createState() => KeyTypeSelectorState();

}

class KeyTypeSelectorState extends State<KeyTypeSelector> {

  final List<String> permissibleKeyTypeValues = ["Major", "Minor", "Blues Major", "Blues Minor"];
  String selectedKeyType = DefaultGridConfig.musical_key_type;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedKeyType,
      icon: Icon(Icons.music_note),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: MyColors.dark),
      underline: Container(
        height: 2,
        color: MyColors.dark.withOpacity(0.5),
      ),
      onChanged: (String newValue) {
        Provider.of<GridState>(context).changeKeyType(newValue);
        setState(() {
          selectedKeyType = newValue;
        });
      },
      items: permissibleKeyTypeValues
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

}

