import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //final Function handler;
  final String answerText; // εδω περναει το κειμενο καθε απαντησης
  final void Function()
      handler; //εδω περναει ο pointer για την συναρτηση στην main.dart
  Answer(this.handler, this.answerText); //o constructor για το answer

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // το χρησιμοποιουμε για να πουμε στον container να πιασει ολο το width που βρισκει
      child: Center(
        child: ElevatedButton(
          onPressed: handler,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 40),
            primary: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ), //ο Pointer της συναρτησης στην main που αυξανει το index
          child: Text(answerText),
        ),
      ),
    );
  }
}
