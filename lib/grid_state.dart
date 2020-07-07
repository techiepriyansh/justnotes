import 'dart:async';

import 'package:justnotes/midi_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:justnotes/frequencies.dart';

class GridState extends ChangeNotifier{
  final int gridRowsCount;
  int gridColsCount;

  MusicalKey musicalKey;
  String musicalKeyRootNote;
  String musicalKeyType;

  String instrument;
  
  GridState(this.gridRowsCount, 
    this.gridColsCount, 
    this.musicalKeyRootNote, 
    this.musicalKeyType,
    this.instrument) {

    musicalKey = MusicalKey.getKey(musicalKeyRootNote, musicalKeyType);
    SystemChrome.setEnabledSystemUIOverlays([]);
    MidiProvider.startMidi();

  }

  void changeKeyRootNote(String newNote){
    musicalKeyRootNote = newNote;
    musicalKey = MusicalKey.getKey(musicalKeyRootNote, musicalKeyType);

    notifyListeners();
  }

  void changeKeyType(String newKeyType) {
    musicalKeyType = newKeyType;
    musicalKey = MusicalKey.getKey(musicalKeyRootNote, musicalKeyType);
    gridColsCount = musicalKey.octaveLength;

    notifyListeners();
  }

  void changeInstrument(String newInstrument) {
    instrument = newInstrument;
    MidiProvider.changeInstrument(instrument);

    notifyListeners();
  }

}