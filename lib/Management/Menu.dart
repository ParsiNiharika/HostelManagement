import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/MenuCard.dart';

import 'managemntHomeScreen.dart';

class Menu extends StatelessWidget {

  static const weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thrusday',
    'Firday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "MENU",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
      body: ListView.builder(
        itemCount: weekdays.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints.tightFor(width: 250, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return MenuCard(day:weekdays[index]);

                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        weekdays[index],
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
              ),
            ],
          );
        },),
    );
  }
}