import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:justnotes/default_grid_config.dart';
import 'package:justnotes/grid_state.dart';
import 'package:justnotes/grid_button.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gridRowsCount = Provider.of<GridState>(context).gridRowsCount;
    final gridColsCount = Provider.of<GridState>(context).gridColsCount;
    final buttons = List.generate(
        gridColsCount,
        (columnIndex) => List.generate(
            gridRowsCount, (rowIndex) {

              //find out which degree this button is
              int pos = rowIndex * gridColsCount + columnIndex;
              int middle = gridColsCount * ((gridRowsCount + 1)/2).floor();
              if (pos < middle) pos -= 1;
              int degree = pos - middle + 1;

              int note = Provider.of<GridState>(context).musicalKey.getNoteAt(degree);

              return GridButton(columnIndex, rowIndex, note); 
            
            }));

    final buttonGrid = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map(
            (buttonColumn) => Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buttonColumn,
              ),
            ),
          )
          .toList(),
    );

    return buttonGrid;
  }
}
