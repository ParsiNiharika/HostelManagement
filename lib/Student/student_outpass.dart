import "package:flutter/material.dart";
import 'package:hostel_management/Student/student_outpass_form.dart';

class StudentOutpass extends StatefulWidget {
  const StudentOutpass({Key? key}) : super(key: key);

  @override
  _StudentOutpassState createState() => _StudentOutpassState();
}

class _StudentOutpassState extends State<StudentOutpass> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            "OUT PASS",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          width: 350,
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const StudentOutpassForm();
                  }));
                },
                child: const Text("Request Outpass")),
            (status == true)
                ? Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("Granted",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Roll No: 19071A0578",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("Student Name: K Harshitha",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("Room No: 302",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("Date: 12-02-2021",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("Time: 16:25",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Text(
                              "Reason: Vaccination has become a huge problem it can turn you intno a crovodile",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : const Text("Pending",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    )),
          ]),
        ));
  }
}
