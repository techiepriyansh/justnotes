import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:justnotes/grid.dart';
import 'package:justnotes/default_grid_config.dart';
import 'package:justnotes/my_colors.dart';
import 'package:justnotes/grid_state.dart';
import 'package:justnotes/grid_control.dart';

import 'package:justnotes/frequencies.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => GridState(
        DefaultGridConfig.rows_count,
        DefaultGridConfig.cols_count,
        DefaultGridConfig.musical_key_root_note,
        DefaultGridConfig.musical_key_type,
        DefaultGridConfig.instrument,
      ),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JustNotes - Lauchpad',
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Grid(),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: GridControl(),  
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
