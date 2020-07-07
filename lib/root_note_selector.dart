import 'package:flutter/material.dart';

import 'package:justnotes/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:justnotes/grid_state.dart';
import 'package:justnotes/default_grid_config.dart';

class RootNoteSelector extends StatefulWidget {

  @override
  RootNoteSelectorState createState() => RootNoteSelectorState();

}

class RootNoteSelectorState extends State<RootNoteSelector> {

  final List<String> permissibleRootNoteValues = ["C2", "C2#", "D2", "D2#", "E2", "F2", "F2#", "G2", "G2#", "A2", "A2#", "B2", "C3", "C3#", "D3", "D3#", "E3", "F3", "F3#", "G3", "G3#", "A3", "A3#", "B3", "C4", "C4#", "D4", "D4#", "E4", "F4", "F4#", "G4", "G4#", "A4", "A4#", "B4", "C5", "C5#", "D5", "D5#", "E5", "F5", "F5#", "G5", "G5#" ];
  String selectedNote = DefaultGridConfig.musical_key_root_note;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedNote,
      icon: Icon(Icons.music_note),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: MyColors.dark),
      underline: Container(
        height: 2,
        color: MyColors.dark.withOpacity(0.5),
      ),
      onChanged: (String newValue) {
        Provider.of<GridState>(context).changeKeyRootNote(newValue);
        setState(() {
          selectedNote = newValue;
        });
      },
      items: permissibleRootNoteValues
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

}

