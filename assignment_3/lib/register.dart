import 'package:flutter/material.dart';
import 'package:form/usersdb.dart';
import 'dart:async';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'usersdb.dart';

// Create a Form widget.
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

// custom form with title and sub title
// getter for details with icons
// making sure what project wants is complete with validation
//sumbit button to save them in sql
//if it is complete it automatically sign in the user.

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<Register> {
  databaseInsert() {
    DBHelper.insert('userss', {
      'name': fnameController.text,
      'surname': lnameController.text,
      'date': _dateController.text,
      'gender': gndrController.text,
      'weight': wController.text,
      'username': usrnmController.text,
      'pwd': pwdController.text,
      'email': mailController.text
    });
  }

  Future<void> fetchData() async {
    final datalist = await DBHelper.getData("userss");
    print(datalist);
  }

  // Δημιουργουμε ενα global key το οποιο χαρακτηριζει μονδαικα την φορμα (Form widget)
  // και επιτρεπει να κανουμε validate την φορμα (να ελεγχουμε αν εχουν περασει σωστα ολες οι τιμες)
  //
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2021));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController();

  TextEditingController lnameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  TextEditingController gndrController = TextEditingController();
  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';

  final List<Map<String, dynamic>> _gndr = [
    {
      'value': 'male',
      'label': 'Male',
      'icon': const Icon(Icons.male),
    },
    {
      'value': 'female',
      'label': 'Female',
      'icon': const Icon(Icons.female),
    },
    {
      'value': 'other',
      'label': 'Other',
      'icon': const Icon(Icons.perm_identity),
    },
  ];
  void initState() {
    super.initState();

    //_initialValue = 'starValue';
    gndrController = TextEditingController(text: '');

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        //_initialValue = 'circleValue';
        gndrController.text = 'circleValue';
      });
    });
  }

  TextEditingController wController = TextEditingController();

  TextEditingController usrnmController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    const Center(
                        child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
                    const Center(
                        child: Text("Create an account, it's free",
                            style: TextStyle(
                                fontSize: 20, color: Colors.black45))),
                    ////////////////Name

                    TextFormField(
                      controller: fnameController,

                      decoration: const InputDecoration(
                        icon: Icon(Icons.short_text),
                        labelText: 'First Name',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    //////////////Surname

                    TextFormField(
                      controller: lnameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.short_text),
                        labelText: 'Last Name',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please enter a valid last name';
                        }
                        return null;
                      },
                    ),
                    //////////////Birthdate

                    TextFormField(
                      readOnly: true,
                      controller: _dateController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.date_range),
                        labelText: 'Date',
                      ),
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1910),
                          lastDate: DateTime(2025),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            _dateController.text =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date.';
                        }
                        return null;
                      },
                    ),
                    //////////////Gender

                    SelectFormField(
                      type: SelectFormFieldType.dialog,
                      controller: gndrController,
                      //initialValue: _initialValue,
                      icon: const Icon(Icons.perm_identity),
                      labelText: 'Gender',
                      changeIcon: true,
                      dialogTitle: 'Pick your gender',
                      dialogCancelBtn: 'CANCEL',
                      items: _gndr,
                      onChanged: (value) =>
                          setState(() => _valueChanged = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please select a gender.';
                        }
                        setState(() => _valueToValidate = value);
                        return null;
                      },
                      onSaved: (value) =>
                          setState(() => _valueSaved = value ?? ''),
                    ),
                    //////////////Weight

                    TextFormField(
                      controller: wController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.monitor_weight),
                        labelText: 'Weight',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please enter a valid weight';
                        }
                        //else if (value.isInt )
                        return null;
                      },
                    ),
                    ////////////// Username

                    TextFormField(
                      controller: usrnmController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.text_fields),
                        labelText: 'Username',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please enter a valid username';
                        }
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
                        if (value == null || value.isEmpty) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please enter a valid Password';
                        } else if (value.length < 8) {
                          return 'Please enter 8 or longer character password!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    ////////////// Email

                    TextFormField(
                      controller: mailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null ||
                            !value.contains('@') ||
                            !value.contains('.')) {
                          //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              print(fnameController.text);
                              print(lnameController.text);
                              print(_dateController.text);
                              print(gndrController.text);
                              print(wController.text);
                              print(usrnmController.text);
                              print(pwdController
                                  .text); //απλα τυπωνουμε τις τιμες που εγραψε ο χρηστης στα πεδια
                              print(mailController.text);
                              databaseInsert();
                              fetchData();
                              // Αν η φορμα ειναι valid τυπωσε ενα snackbar (στο κατω μερος της εφαρμογης εμφανιζεται μια μαυρη μπαρα με το κειμενο)
                              // συνηθως εδω σε πραγματικες εφαρμογες σωνονται οι πληροφοριες στην βαση
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Succesfully registered!')),
                              );
                              Navigator.of(context).pushNamed('/mainview');
                            }
                          },
                          child: const Text('Submit'),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.purple)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //),
        ],
      ),
    );
  }
}
