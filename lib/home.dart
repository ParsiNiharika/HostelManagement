import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Student/student_outpass.dart';
import 'package:hostel_management/Student/student_outpass_form.dart';

import 'Management/ManagementLogin.dart';
import 'Student/StudentLogin.dart';

class Home extends StatelessWidget {
  showManagmentScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return ManagementLogin();
        },
      ),
    );
  }

  showStudentScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return StudentLogin();
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "HOSTEL MANAGEMENT",
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
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 250, height: 50),
                        child: ElevatedButton(
                          onPressed: () => showStudentScreen(context),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'Student',
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
                              'Parent',
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
                          onPressed: () => showManagmentScreen(context),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              'Management',
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
                  ]))
            ])),
      ),
    );
  }
}
