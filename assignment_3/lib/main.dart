import 'package:flutter/material.dart';
import 'package:form/update.dart';
import 'dart:async';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'drawer.dart';
import 'package:form/usersdb.dart';
import 'usersdb.dart';
import 'register.dart';
import 'login.dart';
import 'demographicss.dart';

void main() {
  runApp(MaterialApp(
    title: 'SQL program',
    initialRoute: '/login',
    routes: {
      // '/': (context) => MyApp(), //define path with nameroutes
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/mainview': (context) => MainView(),
      '/drawer': (context) => MainDrawer(),
      '/demographics': (context) => Demographics(),
      //'/demographics': (context) => Update(id: ,),
      // '/update': (context) => const Update(uservalue: 'username'),
    },
  ));
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.purple, title: Text("SQFlite app")),
      drawer: MainDrawer(), // καλουμε ενα custom drawer
      body: Center(
        child: Text("Database Functions"),
      ),
    );
  }
}
