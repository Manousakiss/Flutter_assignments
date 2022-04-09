import 'package:flutter/material.dart';
import 'package:form/drawer.dart';
import 'package:form/main.dart';
import 'dart:async';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:form/usersdb.dart';
import 'usersdb.dart';

// Create a Form widget.
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<Login> {
  //checking if username and pass exists
  //if one of them wrong then returns false
  //if the list of the credentials is empty returns false and says wrong credentials
  //if exists then it matches the database and returns true and logs in
  // button to navigate to sign up if it isn't user of the app
  Future<bool?> chechData(String usrnmController, String pwd) async {
    print("before");
    print(usrnmController);
    final datalist = await DBHelper.getUser(usrnmController, pwd);
    print("datalist now");
    print(datalist);
    if (datalist!.isEmpty) {
      return false;
    } else {
      String username = datalist[0].values.elementAt(0);
      String pswd = datalist[0].values.elementAt(1);
      print("to username");
      print(username);
      print("to pwd");
      print(pswd);
      if (username == usrnmController) {
        if (pwd == pswd) {
          print('ok');
          print(datalist);
          return true;
        }
      } else {
        print('invalid');
        return false;
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController usrnmController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(top: 90.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Center(
                  child: Text(
                "Sign in",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )),

              ////////////// Username

              TextFormField(
                controller: usrnmController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.text_fields),
                  labelText: 'Username',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  return null;
                },
              ),
              ////////////// Password

              TextFormField(
                controller: pwdController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Password',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  return null;
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    onPressed: () async {
                      var check = await chechData(
                          usrnmController.text, pwdController.text);
                      print('the check');
                      print(check);
                      if (check == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainView(),
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Succesfully logged in!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wrong cridentials!')),
                        );
                      }
                    },
                    child: const Text('Log in'),
                    style: ElevatedButton.styleFrom(primary: Colors.purple)),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "New here? Let's get ",
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                        child: const Text(
                          "Started! ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.purple),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/register');
                        }),
                  ])
            ],
          ),
        ),
      ),
    ));
  }
}
