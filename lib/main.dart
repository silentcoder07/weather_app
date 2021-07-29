import 'package:flutter/material.dart';
import 'package:weather_app/Screens/loading_Screen.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen()
    );
  }
}

