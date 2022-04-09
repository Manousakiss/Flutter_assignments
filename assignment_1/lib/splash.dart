import 'package:ass1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

//splash screen with text and typewriter animation
//background image of covid19
// elevated button with navigator to the homepage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(70),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'COVID-19 \n CORONAVIRUS!',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        speed: const Duration(milliseconds: 70),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: Duration(milliseconds: 0),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                )),
                Container(
                    margin: const EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Get started',
                          style: TextStyle(fontSize: 30),
                        )))
              ]),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/coronavirus.jpg'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
