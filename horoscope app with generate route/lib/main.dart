import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_listesi.dart';
import 'package:flutter_burclar/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
