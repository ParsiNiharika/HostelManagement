// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/foodComplaints.dart';
import 'package:hostel_management/Management/othersComplaints.dart';
import './plumberComplaints.dart';
import './carpenterComplaints.dart';

class Complaints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "COMPLAINTS",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      body:Container(
        child: SafeArea(
            bottom: false,
            child: Stack(children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
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
                                  return Plumber();

                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'Plumber',
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
                        SizedBox(height: 10),
                        Center(
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(width: 250, height: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                  return Carpenter();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'Carpenter',
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
                        SizedBox(height: 10),
                        Center(
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(width: 250, height: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                  return Food();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'Food',
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
                        SizedBox(height: 10),
                        Center(
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(width: 250, height: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                  return Others();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'Others',
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
                      ]))
            ])),
      ),
    );
  }
}