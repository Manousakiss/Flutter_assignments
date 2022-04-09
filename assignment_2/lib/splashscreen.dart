import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //splash screen text
  var yourList = [
    "I am improving all time.",
    "Listen to emotions but also evaluate.",
    "Trying hard will get me what I want.",
    "Each day is a new day. Try again."
  ];
  int randomIndex = 0;
  //random number from list length
  @override
  void initState() {
    super.initState();
    randomIndex = Random().nextInt(yourList.length);
    Timer(Duration(seconds: 5), () {
      // after X seconds do :
      Navigator.pushNamed(context, '/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          //set the image full screen , style
          // the image path
          child: Text(yourList[randomIndex],
              style: const TextStyle(fontSize: 45, color: Colors.white)),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splashphoto.jpg'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
