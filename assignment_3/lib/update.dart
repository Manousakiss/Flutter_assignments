// import 'package:flutter/material.dart';
// import 'package:form/usersdb.dart';
// import 'dart:async';
// import 'package:gender_picker/gender_picker.dart';
// import 'package:gender_picker/source/enums.dart';
// import 'package:intl/intl.dart';
// import 'package:select_form_field/select_form_field.dart';
// import 'usersdb.dart';

// // Create a Form widget.
// class Update extends StatefulWidget {
//   final String uservalue;
//   const Update({Key? key, required this.uservalue}) : super(key: key);
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

// class MyCustomFormState extends State<Update> {
//   List<Map<String, dynamic>> _dList = [];
//   bool _isLoading = true;
//   void _refreshData() async {
//     final data = await DBHelper.getItems();
//     setState(() {
//       _dList = data;
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _refreshData(); // Loading the diary when the app starts
//     _showForm('uservalue');
//   }

//   // void _showForm(String? username) async {
//   //   if (username != null) {
//   //     // id == null -> create new item
//   //     // id != null -> update an existing item
//   //     final existingJournal =
//   //     _dList.firstWhere((element) => element['username'] == username);
//   //     fnameController= existingJournal['title'];
//   //     surname= existingJournal['title'];
//   //       date= existingJournal['title'];
//   //         gender = existingJournal['title'];
//   //         weight= existingJournal['title'];
//   //         username= existingJournal['title'];
//   //         pwd= existingJournal['title'];
//   //         email = existingJournal['title'];
//   //   }
//   void _showForm(String? uservalue) async {
//     if (uservalue != null) {
//       // id == null -> create new item
//       // id != null -> update an existing item
//       final existingJournal =
//           _dList.firstWhere((element) => element['username'] == uservalue);
//       fnameController.text = existingJournal['name'];
//       lnameController.text = existingJournal['surname'];
//       _dateController.text = existingJournal['date'];
//       gndrController.text = existingJournal['date'];
//       wController.text = existingJournal['weight'];
//       usrnmController.text = existingJournal['username'];
//       pwdController.text = existingJournal['pwd'];
//       mailController.text = existingJournal['email'];
//     }
//   }

//   Future<void> fetchData() async {
//     final datalist = await DBHelper.getData("users");
//     print(datalist);
//   }

//   // Δημιουργουμε ενα global key το οποιο χαρακτηριζει μονδαικα την φορμα (Form widget)
//   // και επιτρεπει να κανουμε validate την φορμα (να ελεγχουμε αν εχουν περασει σωστα ολες οι τιμες)
//   //
//   DateTime currentDate = DateTime.now();
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2021));
//     if (pickedDate != null && pickedDate != currentDate)
//       setState(() {
//         currentDate = pickedDate;
//       });
//   }

// // Update an existing item
//   Future<void> _updateItem(
//       String name,
//       String surname,
//       String date,
//       String gender,
//       int weight,
//       String username,
//       String pwd,
//       String email) async {
//     await DBHelper.updateItem(
//         name, surname, date, gender, weight, username, pwd, email);
//     _refreshData();
//   }

//   final _formKey = GlobalKey<FormState>();

//   TextEditingController fnameController = TextEditingController();

//   TextEditingController lnameController = TextEditingController();

//   final TextEditingController _dateController = TextEditingController();

//   TextEditingController gndrController = TextEditingController();
//   String _valueChanged = '';
//   String _valueToValidate = '';
//   String _valueSaved = '';

//   final List<Map<String, dynamic>> _gndr = [
//     {
//       'value': 'male',
//       'label': 'Male',
//       'icon': const Icon(Icons.male),
//     },
//     {
//       'value': 'female',
//       'label': 'Female',
//       'icon': const Icon(Icons.female),
//     },
//     {
//       'value': 'other',
//       'label': 'Other',
//       'icon': const Icon(Icons.perm_identity),
//     },
//   ];

//   TextEditingController wController = TextEditingController();

//   TextEditingController usrnmController = TextEditingController();

//   TextEditingController pwdController = TextEditingController();

//   TextEditingController mailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 40,
//             child: Container(
//               margin: const EdgeInsets.only(top: 60.0),
//               //padding: const EdgeInsets.all(20),
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.arrow_back_ios_new),
//                 ),
//               ),
//             ),
//           ),

//           Form(
//             key: _formKey,
//             child: Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ListView(
//                   children: [
//                     const Center(
//                         child: Text(
//                       "Update your contact information",
//                       style:
//                           TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                     )),

//                     ////////////////Name

//                     TextFormField(
//                       controller: fnameController,

//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.short_text),
//                         labelText: 'First Name',
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null) {
//                           //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
//                           return 'Please enter a valid name';
//                         }
//                         return null;
//                       },
//                     ),
//                     //////////////Surname

//                     TextFormField(
//                       controller: lnameController,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.short_text),
//                         labelText: 'Last Name',
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null) {
//                           //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
//                           return 'Please enter a valid last name';
//                         }
//                         return null;
//                       },
//                     ),
//                     //////////////Birthdate

//                     TextFormField(
//                       readOnly: true,
//                       controller: _dateController,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.date_range),
//                         labelText: 'Date',
//                       ),
//                       onTap: () async {
//                         await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1910),
//                           lastDate: DateTime(2025),
//                         ).then((selectedDate) {
//                           if (selectedDate != null) {
//                             _dateController.text =
//                                 DateFormat('yyyy-MM-dd').format(selectedDate);
//                           }
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter date.';
//                         }
//                         return null;
//                       },
//                     ),
//                     //////////////Gender

//                     SelectFormField(
//                       type: SelectFormFieldType.dialog,
//                       controller: gndrController,
//                       //initialValue: _initialValue,
//                       icon: const Icon(Icons.perm_identity),
//                       labelText: 'Gender',
//                       changeIcon: true,
//                       dialogTitle: 'Pick your gender',
//                       dialogCancelBtn: 'CANCEL',
//                       items: _gndr,
//                       onChanged: (val) => setState(() => _valueChanged = val),
//                       validator: (val) {
//                         setState(() => _valueToValidate = val ?? '');
//                         return null;
//                       },
//                       onSaved: (val) => setState(() => _valueSaved = val ?? ''),
//                     ),
//                     //////////////Weight

//                     TextFormField(
//                       controller: wController,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.monitor_weight),
//                         labelText: 'Weight',
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null) {
//                           //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
//                           return 'Please enter a valid weight';
//                         }
//                         //else if (value.isInt )
//                         return null;
//                       },
//                     ),
//                     ////////////// Username

//                     TextFormField(
//                       controller: usrnmController,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.text_fields),
//                         labelText: 'Username',
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null) {
//                           //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
//                           return 'Please enter a valid username';
//                         }
//                         return null;
//                       },
//                     ),
//                     ////////////// Password

//                     TextFormField(
//                       controller: pwdController,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.password),
//                         labelText: 'Password',
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null) {
//                           //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
//                           return 'Please enter a valid Password';
//                         } else if (value.length > 8) {
//                           return 'Please enter 8 or longer character password!';
//                         }
//                         return null;
//                       },
//                     ),
//                     ////////////// Email

//                     TextFormField(
//                       controller: mailController,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.email),
//                         labelText: 'Email',
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null ||
//                             !value.contains('@') ||
//                             !value.contains('.')) {
//                           //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: ElevatedButton(
//                           onPressed: () {
//                             // Validate returns true if the form is valid, or false otherwise.
//                             if (_formKey.currentState!.validate()) {
//                               print(fnameController.text);
//                               print(lnameController.text);
//                               print(_dateController.text);
//                               print(gndrController.text);
//                               print(wController.text);
//                               print(usrnmController.text);
//                               print(pwdController
//                                   .text); //απλα τυπωνουμε τις τιμες που εγραψε ο χρηστης στα πεδια
//                               print(mailController.text);

//                               fetchData();
//                               // Αν η φορμα ειναι valid τυπωσε ενα snackbar (στο κατω μερος της εφαρμογης εμφανιζεται μια μαυρη μπαρα με το κειμενο)
//                               // συνηθως εδω σε πραγματικες εφαρμογες σωνονται οι πληροφοριες στην βαση
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Succesfull update!')),
//                               );
//                               Navigator.of(context).pushNamed('/mainview');
//                             }
//                           },
//                           child: const Text('Update'),
//                           style:
//                               ElevatedButton.styleFrom(primary: Colors.purple)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           //),
//         ],
//       ),
//     );
//   }
// }
