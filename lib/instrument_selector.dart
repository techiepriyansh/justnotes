import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:justnotes/my_colors.dart';
import 'package:justnotes/grid_state.dart';
import 'package:justnotes/midi_instruments.dart';
import 'package:justnotes/default_grid_config.dart';

class InstrumentSelector extends StatefulWidget {

  @override
  InstrumentSelectorState createState() => InstrumentSelectorState();

}

class InstrumentSelectorState extends State<InstrumentSelector> {


  // List<String> instrument_names = [
  //   "Acoustic Grand Piano", 
  //   "Bright Acoustic Piano", 
  //   "Electric Grand Piano", 
  //   "Honky Tonk Piano", 
  //   "Electric Piano 0", 
  //   "Electric Piano 1", 
  //   "Harpsichord", 
  //   "Clavi", 
  //   "Celesta", 
  //   "Glockenspiel", 
  //   "Music Box", 
  //   "Vibraphone", 
  //   "Marimba", 
  //   "Xylophone", 
  //   "Tubular Bells", 
  //   "Dulcimer", 
  //   "Drawbar Organ", 
  //   "Percussive Organ", 
  //   "Rock Organ", 
  //   "Church Organ", 
  //   "Reed Organ", 
  //   "Accordion", 
  //   "Harmonica", 
  //   "Tango Accordion", 
  //   "Acoustic Guitar Nylon", 
  //   "Acoustic Guitar Steel", 
  //   "Electric Guitar Jazz", 
  //   "Electric Guitar Clean", 
  //   "Electric Guitar Muted", 
  //   "Overdriven Guitar", 
  //   "Distortion Guitar", 
  //   "Guitar Harmonics", 
  //   "Acoustic Bass", 
  //   "Electric Bass Finger", 
  //   "Electric Bass Pick", 
  //   "Fretless Bass", 
  //   "Slap Bass 0", 
  //   "Slap Bass 1", 
  //   "Synth Bass 0", 
  //   "Synth Bass 1", 
  //   "Violin", 
  //   "Viola", 
  //   "Cello", 
  //   "Contrabass", 
  //   "Tremolo Strings", 
  //   "Pizzicato Strings", 
  //   "Orchestral Harp", 
  //   "Timpani", 
  //   "String Ensemble 0", 
  //   "String Ensemble 1", 
  //   "Synthstrings 0", 
  //   "Synthstrings 1", 
  //   "Choir Aahs", 
  //   "Voice Oohs", 
  //   "Synth Voice", 
  //   "Orchestra Hit", 
  //   "Trumpet", 
  //   "Trombone", 
  //   "Tuba", 
  //   "Muted Trumpet", 
  //   "French Horn", 
  //   "Brass Section", 
  //   "Synthbrass 0", 
  //   "Synthbrass 1", 
  //   "Soprano", 
  //   "Alto Sax", 
  //   "Tenor Sax", 
  //   "Baritone Sax", 
  //   "Oboe", 
  //   "English Horn", 
  //   "Bassoon", 
  //   "Clarinet", 
  //   "Piccolo", 
  //   "Flute", 
  //   "Recorder", 
  //   "Pan Flute", 
  //   "Blown Bottle", 
  //   "Shakuhachi", 
  //   "Whistle", 
  //   "Ocarina", 
  //   "Lead 0 Square", 
  //   "Lead 1 Sawtooth", 
  //   "Lead 2 Calliope", 
  //   "Lead 3 Chiff", 
  //   "Lead 4 Charang", 
  //   "Lead 5 Voice", 
  //   "Lead 6 Fifths", 
  //   "Lead 7 Bass Lead", 
  //   "Pad 0 New Age", 
  //   "Pad 1 Warm", 
  //   "Pad 2 Polysynth", 
  //   "Pad 3 Choir", 
  //   "Pad 4 Bowed", 
  //   "Pad 5 Metallic", 
  //   "Pad 6 Halo", 
  //   "Pad 7 Sweep", 
  //   "Fx 0 Rain", 
  //   "Fx 1 Soundtrack", 
  //   "Fx 2 Crystal", 
  //   "Fx 3 Atmosphere", 
  //   "Fx 4 Brightness", 
  //   "Fx 5 Goblins", 
  //   "Fx 6 Echoes", 
  //   "Fx 7 Sci Fi", 
  //   "Sit R", 
  //   "Banjo", 
  //   "Shamisen", 
  //   "Koto", 
  //   "Kalimba", 
  //   "Bag Pipe", 
  //   "Fiddle", 
  //   "Shanai", 
  //   "Tinkle Bell", 
  //   "Agogo", 
  //   "Steel Drums", 
  //   "Woodblock", 
  //   "Taiko Drum", 
  //   "Melodic Tom", 
  //   "Synth Drum", 
  //   "Reverse Cymbal", 
  //   "Guitar Fret Noise", 
  //   "Breath Noise", 
  //   "Seashore", 
  //   "Bird Tweet", 
  //   "Telephone Ring", 
  //   "Helicopter", 
  //   "Applause", 
  //   "Gunshot"
  // ];

  List<String> instrument_names = MidiInstruments.instruments.keys.toList();

  String selectedInstrument = DefaultGridConfig.instrument;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedInstrument,
      icon: Icon(Icons.music_note),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: MyColors.dark),
      underline: Container(
        height: 2,
        color: MyColors.dark.withOpacity(0.5),
      ),
      onChanged: (String newValue) {
        Provider.of<GridState>(context).changeInstrument(newValue);
        setState(() {
          selectedInstrument = newValue;
        });
      },
      items: instrument_names
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

}

