import 'package:flutter/material.dart';
import 'dart:math';

import 'package:rock_paper_scissors/MyGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGame(),
    );
  }
}

