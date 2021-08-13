import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Loading.dart';

import 'Screens/Home.dart';
import 'Screens/Location.dart';
import 'Screens/Loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => loading(),
        "/home": (context) => Home(),
        "/location": (context) => location(),
        "/loading": (context) => loading(),
      },
    );
  }
}
