import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/ContactUs.dart';
import 'package:hostel_management/Management/busTimings.dart';
import 'package:hostel_management/Student/student_complaint.dart';
import 'package:hostel_management/Student/student_outpass.dart';
import 'package:hostel_management/Student/student_outpass_form.dart';
import './ViewMenu.dart';

class StudentHomeScreen extends StatelessWidget {
  String rollno;
  StudentHomeScreen(this.rollno);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "Student",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
            bottom: false,
            child: Stack(children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return BusTimings();
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'BUS TIMINGS',
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return ViewMenu();
                            }));
                          },
                          child: const Padding(
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) => new StudentComplaint()));
                          },

                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'FILE A COMPLAINT',
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const StudentOutpassForm();
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'REQUEST OUTPASS',
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return StudentOutpass(rollno: rollno);
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'OUTPASS STATUS',
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return ContactUs();
                            }));
                          },
                          child: const Padding(
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
                  ]))
            ])),
      ),
    );
  }
}
