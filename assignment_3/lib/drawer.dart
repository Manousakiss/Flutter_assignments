// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

// drawer with the current settings that project wanted.
// items with specific icons , title and navigation

  //builder για το ListTile
  Widget buildListTile(
      String title, IconData icon, BuildContext context, String route) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(route); //η συναρτηση που περναμε στον pageHandler
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.purple, //χρωμα του header του drawer
            // decoration:BoxDecoration(color:Colors.blue), διαφορετικος τροπος να περασουμε χρωμα
            child: Text(
              "SQFlite app",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),

          buildListTile("Demographics", Icons.person, context, '/demographics'),
          SizedBox(
            height: 10,
          ), //για να αφησουμε ενα κενο
        ],
      ),
    );
  }
}
