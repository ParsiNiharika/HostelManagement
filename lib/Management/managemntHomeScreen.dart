import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/Complaints.dart';
import './addStudent.dart';
import './busTimings.dart';
import './ContactUs.dart';
import './Complaints.dart';

class ManagementHomeScreen extends StatelessWidget {

  showManagmentScreen(context){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "MANAGEMENT",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:
      Container(
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
                                    return AddStudent();

                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'Add Student',
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
                                  return BusTimings();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'Bus Timings',
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
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                  return ContactUs();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'CONTACT US',
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
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'MENU',
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
                                  return Complaints();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'COMPLAINTS',
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
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  'OUTPASSES',
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
      ),);
  }
}