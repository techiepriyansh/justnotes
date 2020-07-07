import 'package:flutter/material.dart';

import 'package:justnotes/my_colors.dart';
import 'package:justnotes/root_note_selector.dart';
import 'package:justnotes/key_type_selector.dart';
import 'package:justnotes/instrument_selector.dart';

class GridControl extends StatefulWidget{

  @override 
  GridControlState createState() => GridControlState();

}

class GridControlState extends State<GridControl> {

  @override Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.light.withOpacity(0.2),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget> [
                RootNoteSelector(),
                KeyTypeSelector(),
              ], 
            ),
          ),

          Expanded(
            flex: 1,
            child: InstrumentSelector(),
          ),

          Expanded(
            flex: 1,
            child: Text(
              "JUST NOTES - Launchpad",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: MyColors.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}