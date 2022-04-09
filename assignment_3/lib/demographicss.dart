import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import './main.dart';
import 'drawer.dart';
import 'usersdb.dart';

class Demographics extends StatefulWidget {
  const Demographics({Key? key}) : super(key: key);

  @override
  State<Demographics> createState() => _DemographicsState();
}

//load the data from sql that user gave while sign up.
// thats it. i didnt do the change.

class _DemographicsState extends State<Demographics> {
  List<Map<String, dynamic>> _dList = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DBHelper.getItems();
    setState(() {
      _dList = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demographics"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _dList.length, //όσο το μήκος της λίστας
              itemBuilder: (context, index) => Card(
                  color: Colors.purple,
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['name']),
                        subtitle: Text('name'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['surname']),
                        subtitle: Text('Surname'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      ////////////

                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['date']),
                        subtitle: Text('date'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      /////////////////
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['gender']),
                        subtitle: Text('gender'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      //////////
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['weight'].toString()),
                        subtitle: Text('weight'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      /////////////
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['username']),
                        subtitle: Text('username'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      /////////////
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['pwd']),
                        subtitle: Text('pwd'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                      /////////////
                      ListTile(
                        //για κάθε θέση παίρνω και τα δύο πεδία
                        title: Text(_dList[index]['email']),
                        subtitle: Text('email'),

                        trailing: SizedBox(
                          width: 50,
                          child: Row(children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                //το id επιστρέφει στην showForm και ανανεώνει τα data
                                onPressed: () => ''),
                          ]),
                        ),
                      ),
                    ],
                  )),
            ),
    );
  }
}
