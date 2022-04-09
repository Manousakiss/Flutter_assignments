import 'package:ass2_4909/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'question.dart';
import 'answer.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  //define newData list
  //define index dor questions
  List<dynamic> newData = [];
  var questionIndex = 0;
  void pressedButton() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Questionnaire"),
      ),
      body: (Center(
        // futurebuilder to load json file
        // the snapshot.data gives json data.
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/questionnaire.json'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              var newData = json.decode(snapshot.data.toString());
              //if snapshot is null
              return snapshot.data == null
                  ? const Text("error on fetch")
                  // through 9 because i already know the number
                  : questionIndex < 9
                      ? Column(
                          children: [
                            const Text(
                                "Over the last 2 weeks, how often have you been bothered by any of the following problems?\n\n\n"),
                            Question(newData[questionIndex]['questionText']),
                            ...(newData[questionIndex]['answers']
                                    as List<dynamic>)
                                .map(
                                    // define that list will always be list with questions
                                    // return them to list
                                    (answer) {
                              //κανουμε map το list question
                              return Answer(pressedButton, answer);
                            }).toList()
                          ],
                        )
                      : // if >9 than its done
                      //show its done and a button to go back
                      Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "You are done :)",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.all(30),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(300, 40),
                                          primary: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Go back',
                                          style: TextStyle(fontSize: 30),
                                        )))
                              ]),
                        );
            }),
      )),
    );
  }
}
