import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'overview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// making 4 lists with syptoms and prevention
// 2 of them include text of syptom and prevention
// 2 of them include the path of syptoms and prevention images

class _HomePageState extends State<HomePage> {
  var syptomcardtext = [
    'Shortness of breath',
    'Dry cough',
    'Fever',
    'Sore throat',
    'Tiredness'
  ];
  List<String> syptomcardimages = [
    "assets/images/breath.jpg",
    "assets/images/drycough.jpg",
    "assets/images/fever.jpg",
    "assets/images/sorethroat.jpg",
    "assets/images/tired.jpg",
  ];

  var preventioncardtext = [
    'Keep Distance',
    'Use Face Mask',
    'Wash Hands',
    'Disinfect Surfaces',
    'Use Gloves'
  ];
  List<String> preventioncardimages = [
    "assets/images/distance.jpg",
    "assets/images/mask.jpg",
    "assets/images/washhands.jpg",
    "assets/images/area.jpg",
    "assets/images/gloves.jpg",
  ];

//making of syptoms card
// rounded cards
// no elevation
//take the elements through a list created before as arguments
//text under the image

  Widget syptomscard(String text, String imagepath) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Wrap(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imagepath,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(text,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  //fontSize: 30
                )),
          )
        ],
      ),
    );
  }

//making of overview card
// rounded centered card
//take the element direct from asset and set my text and icon
//navigator to the next page of statistics

  Widget overview() {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Overview()));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset('assets/images/map2.jpg',
                    height: 100,
                    alignment: Alignment.bottomLeft,
                    width: 200,
                    fit: BoxFit.cover),
              ),
              const Text(" Overview \n21.118.894",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  )),
              const Icon(
                Icons.arrow_right,
                color: Colors.red,
                size: 50.0,
              )
            ],
          ),
        ));
  }

//making of prevention card
// rounded cards
//take the elements through a list created before as arguments
//text right next each image
//the images were not perfect , they include white bg

  Widget Prevention(String text, String imagepath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(imagepath,
                height: 80,
                alignment: Alignment.bottomLeft,
                width: 70,
                fit: BoxFit.fill),
          ),
          Text(text,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }

// making the app-bar with title and color
// 1st the title of syptoms in body
// then the syptoms with text and image side to side with no elevation
// after that overview with map and number and navigation to statistics
// title prevation on the left side
// rounded prevention cards with text and images side to side

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('COVID-19'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(children: [
            //right align
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                textAlign: TextAlign.left,
                //half title change color
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Syptoms of ",
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
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: syptomcardtext.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: 130,
                          child: syptomscard(
                              syptomcardtext[index], syptomcardimages[index]),
                          alignment: Alignment.bottomCenter);
                    })),
            Container(
              child: overview(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Prevention ",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ]),
              ),
            ),
            SizedBox(
                //it returns a box with specific height and width as long as image and text takes
                height: 110,
                child: ListView.builder(
                    itemCount: preventioncardtext.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Prevention(preventioncardtext[index],
                          preventioncardimages[index]);
                    })),
          ]),
        ));
  }
}
