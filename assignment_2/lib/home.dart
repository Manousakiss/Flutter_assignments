import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listImages = [
    //list with image cards
    'assets/images/suggestions.jpg',
    'assets/images/questions.jpg'
  ];

// rounded cards with elevation
// symmetric vartically
// rounded image
//path dynamically

  Widget customcard(String langname, String imagepath, String route) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Card(
          color: Colors.red,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  elevation: 5.0, //σκια
                  borderRadius: BorderRadius.circular(120),
                  child: SizedBox(
                    height: 220,
                    width: 200,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(imagepath),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  langname,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        //  ),
      ),
    );
  }

// title
//coloring
//list view cards with title and image from list and the path for redirection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Depression CBT"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          customcard("Suggestions", listImages[0], '/suggestions'),
          customcard("Questionnaire", listImages[1], '/questionnaire')
        ],
      ),
    );
  }
}
