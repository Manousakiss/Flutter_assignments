import 'package:flutter/material.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  //set the title, description and image path
  var text = [
    'What is depression? \n',
    'Why is this a problem? \n',
    'When is depression caused by stress? \n',
    'Why does it seem that depression is caused by stress? \n',
  ];
  var shortDescription = [
    'How often does a depressed person hear comments such as these? ...',
    'The misunderstanding occurs because just about everyone has experienced sadness or “feeling down.”...',
    'Although the above conditions appear to be biological conditions that are caused ...',
    'The fact is that the depressive disorders, as is true of most of the physical disorders...'
  ];
  var images = [
    'assets/images/depression.jpg',
    'assets/images/problem.jpg',
    'assets/images/whenstress.jpg',
    'assets/images/whystress.jpg',
  ];

// define the custom card with the above parameters
// card with elevation
// full screen image ON card
//dynamic route, imagepath, title,description
  Widget customcard(
      String text, String imagepath, String shortDescription, String route) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Card(
          elevation: 10.0,
          child: Wrap(
            children: [
              Image(
                fit: BoxFit.contain,
                image: AssetImage(imagepath),
              ),
              ListTile(
                title: Text(text),
                subtitle: Text(shortDescription),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  //title with color
  //cards with horizontal direction
  Widget build(BuildContext context) {
    const title = 'Suggestions';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 470.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 220,
              child: customcard(
                  text[0], images[0], shortDescription[0], '/article0'),
            ),
            SizedBox(
              width: 220,
              child: customcard(
                  text[1], images[1], shortDescription[1], '/article1'),
            ),
            SizedBox(
              width: 220,
              child: customcard(
                  text[2], images[2], shortDescription[2], '/article2'),
            ),
            SizedBox(
              width: 220,
              child: customcard(
                  text[3], images[3], shortDescription[3], '/article3'),
            ),
          ],
        ),
      ),
    );
  }
}
