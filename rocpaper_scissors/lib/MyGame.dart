import 'dart:math';

import 'package:flutter/material.dart';

class MyGame extends StatefulWidget {
  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  final List<String> choices = ['Taş', 'Kağıt', 'Makas'];
  String playerChoice = '';
  String computerChoice = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taş-Kağıt-Makas Oyunu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bilgisayarın Seçimi: $computerChoice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Sonuç: $result',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.map((choice) {
                return ElevatedButton(
                  onPressed: () {
                    playGame(choice);
                  },
                  child: Text(choice),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void playGame(String playerChoice) {
    setState(() {
      this.playerChoice = playerChoice;
      this.computerChoice = choices[Random().nextInt(choices.length)];

      if (playerChoice == computerChoice) {
        result = 'Berabere';
      } else if ((playerChoice == 'Taş' && computerChoice == 'Makas') ||
          (playerChoice == 'Kağıt' && computerChoice == 'Taş') ||
          (playerChoice == 'Makas' && computerChoice == 'Kağıt')) {
        result = 'Kazandın!';
      } else {
        result = 'Kaybettin!';
      }
    });
  }
}
