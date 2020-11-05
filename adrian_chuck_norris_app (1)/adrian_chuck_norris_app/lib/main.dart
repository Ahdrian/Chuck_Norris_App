import 'package:flutter/material.dart';

import 'Screens/homeScreen.dart';

Future<void> main() async {
  runApp(ChuckApp());
}

class ChuckApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adrian Chuck Norris Joke App',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: 'Adrians Chuck Norris Joke App'),
    );
  }
}
