import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophonePage());

class XylophonePage extends StatefulWidget {
  @override
  _XylophonePageState createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  static AudioCache player = AudioCache();

  void playSound(int soundNum) {
    player.play('note$soundNum.wav');
  }

  List generateButtons() {
    List<Widget> buttons = [];
    Expanded button;
    List buttonsConfig = [
      [Colors.red, 1],
      [Colors.orange, 2],
      [Colors.yellow, 3],
      [Colors.green, 4],
      [Colors.teal, 5],
      [Colors.blue, 6],
      [Colors.purple, 7],
    ];

    buttonsConfig.forEach((buttonConfig) {
      button = Expanded(
        child: FlatButton(
          color: buttonConfig[0],
          onPressed: () {
            playSound(buttonConfig[1]);
          },
        ),
      );

      buttons.add(button);
    });

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: generateButtons(),
            ),
          ),
        ),
      ),
    );
  }
}
