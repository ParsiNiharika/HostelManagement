import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/Complaints.dart';
import 'package:hostel_management/Management/grant_outpass.dart';
import './addStudent.dart';
import './busTimings.dart';
import './ContactUs.dart';
import './Complaints.dart';
import 'Menu.dart';

class ManagementHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "MANAGEMENT",
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
                              return AddStudent();
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'ADD STUDENT',
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Menu();
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
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Complaints();
                            }));
                          },
                          child: const Padding(
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
                    const SizedBox(height: 10),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const GrantOutpass();
                            }));
                          },
                          child: const Padding(
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
      ),
    );
  }
}
