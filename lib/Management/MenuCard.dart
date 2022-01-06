// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/Menu.dart';

import 'management_home_screen.dart';

class MenuItem {
  final String Breakfast;
  final String Lunch;
  final String Snacks;
  final String Dinner;

  MenuItem({
    required this.Breakfast,
    required this.Lunch,
    required this.Dinner,
    required this.Snacks,
  });
}

class MenuCard extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? menu = "";
  final String day;
  List<String> MenuItems = [];

  static const time = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Dinner',
  ];

  MenuCard({required this.day});

  Future<void> getMenu() async {
    await FirebaseFirestore.instance
        .collection('Menu')
        .doc(day)
        .get()
        .then((doc) {
      MenuItems.add(doc["Breakfast"].toList().join(" "));
      MenuItems.add(doc["Lunch"].toList().join(" "));
      MenuItems.add(doc["Snacks"].toList().join(" "));
      MenuItems.add(doc["Dinner"].toList().join(" "));
    });
  }

  Future<void> _showMyDialog(
      BuildContext context, String menuTime, String menuData) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(menuTime),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: TextEditingController()..text = menuData,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Change Menu',
                          labelText: 'Menu',
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter valid name';
                          }
                          menu = value;
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form != null && !form.validate()) {
                  return;
                }
                form?.save();
                var menuArray = menu?.split(" ");
                FirebaseFirestore.instance
                    .collection('Menu')
                    .doc(day)
                    .update({menuTime: menuArray});
                Navigator.of(context)
                    .pop(MaterialPageRoute(builder: (_) {
                  return const AlertDialog();
                }));
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new MenuCard(day: day)));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    print(MenuItems);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          day,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<void>(
        future: getMenu(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          var menuItems = MenuItems.toList();
          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          time[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        // width: MediaQuery.of(context).size.width*0.5 ,
                        child: Text(
                          menuItems[index],
                          maxLines: 100,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          _showMyDialog(context, time[index], menuItems[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
