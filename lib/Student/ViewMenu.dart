import 'package:flutter/material.dart';
import 'package:hostel_management/Student/ViewMenuCard.dart';
import 'package:intl/intl.dart';

class ViewMenu extends StatelessWidget {

  final today = DateFormat('EEEE').format(DateTime.now());
  final yesterday = DateFormat('EEEE').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));
  final tomorrow = DateFormat('EEEE').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1));

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
      body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints.tightFor(width: 250, height: 70),
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return ViewMenuCard(day: today);

                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        'Today\'s menu ($today)',
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints.tightFor(width: 250, height: 70),
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return ViewMenuCard(day:tomorrow);

                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        'Tomorrow\'s menu ($tomorrow)',
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints.tightFor(width: 250, height: 70),
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return ViewMenuCard(day:yesterday);

                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                      'Yesterday\'s menu ($yesterday)',
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
          ),
        );
  }
}