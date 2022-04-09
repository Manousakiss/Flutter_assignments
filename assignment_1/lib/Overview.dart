import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

// card with gender,text and percent as arguments
// custon style in each element in card
// if statement for color the percentage.

  Widget card(String gender, String text, String percent) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Wrap(
        children: [
          //height: 100,
          //width: 150,

          ListTile(
            title: Text(
              gender,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          ListTile(
            title: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.blueGrey),
            ),
          ),
          percent == '40.5%' // if--else 59.5% then make text red
              ? ListTile(
                  title: Text(percent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.blueGrey,
                      )),
                )
              : ListTile(
                  title: Text(percent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.red,
                      )),
                )
        ],
      ),
    );
  }

//appbar with title with red color
// text with different color each part with richtext
// decorationbox circular for container with color
//then cards (stated before)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Statistics'),
          backgroundColor: Colors.red,
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.grey[600],
                border: Border.all(),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            height: 310.0,
            child: Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Global Cases of ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                        TextSpan(
                            text: "COVID-19",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                      ]),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white.withOpacity(0),
                  height: 200,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(), // non scrollable
                      children: [
                        Container(
                          width: 180,
                          child: card('MALE', 'Confirmed Cases', '59.5%'),
                        ),
                        Container(
                          width: 180,
                          child: card('FEMALE', 'Confirmed Cases', '40.5%'),
                        )
                      ])),
            ])));
  }
}
