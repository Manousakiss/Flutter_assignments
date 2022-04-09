import 'package:flutter/material.dart';
import 'splash.dart';
import './homepage.dart';
import 'overview.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      // define nameroutes
      '/splash': (context) => SplashScreen(),
      '/homepage': (context) => HomePage(),
      '/overview': (context) => Overview(),
    },
  ));
}
