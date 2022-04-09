import 'package:ass2_4909/suggestions.dart';
import 'package:flutter/material.dart';
import './splashscreen.dart';
import './home.dart';
import './questionnaire.dart';
import './suggestions.dart';
import 'cardpage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Multiple screens',
    initialRoute: '/splashscreen',
    routes: {
      '/': (context) => MyApp(), //define path with nameroutes
      '/splashscreen': (context) => SplashScreen(),
      '/homepage': (context) => HomePage(),
      '/suggestions': (context) => Suggestions(),
      '/questionnaire': (context) => Questionnaire(),
      '/article0': (context) => Article0(),
      '/article1': (context) => Article1(),
      '/article2': (context) => Article2(),
      '/article3': (context) => Article3(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}
