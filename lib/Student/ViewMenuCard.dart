// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/*class MenuItem {
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
}*/

class ViewMenuCard extends StatelessWidget {
  String? menu = "";
  final String day;
  List<String> MenuItems = [];

  static const time = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Dinner',
  ];

  ViewMenuCard({required this.day});

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

  Widget build(BuildContext context) {
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
