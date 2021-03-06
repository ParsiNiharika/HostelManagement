import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

class Outpass {
  final String reason;
  final String roomno;
  final String bedno;
  final String date;
  final String time;
  final bool status;
  final String name;

  Outpass(
      {required this.name,
      required this.roomno,
      required this.bedno,
      required this.date,
      required this.time,
      required this.reason,
      required this.status});
}

class StudentOutpass extends StatefulWidget {
  final String? rollno;
  const StudentOutpass({Key? key, this.rollno}) : super(key: key);
  @override
  _StudentOutpassState createState() => _StudentOutpassState();
}

class _StudentOutpassState extends State<StudentOutpass> {
  String? rollno;
  List<Outpass> outpass = [];
  Future<void> getOutpass() async {
    await FirebaseFirestore.instance
        .collection('students')
        .doc(rollno)
        .get()
        .then((doc) {
      var reason = doc["outpass"]["reason"];
      var roomno = doc["outpass"]["roomNo"];
      var bedno = doc["outpass"]["bedNo"];
      var date = doc["outpass"]["date"];
      var time = doc["outpass"]["time"];
      var status = doc["outpass"]["status"];
      var name = doc['name'];
      Outpass pass = Outpass(
        name: name,
        roomno: roomno,
        bedno: bedno,
        date: date,
        time: time,
        reason: reason,
        status: status,
      );
      outpass.add(pass);
    });
  }

  @override
  Widget build(BuildContext context) {
    rollno = widget.rollno;
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
      body: FutureBuilder<void>(
          future: getOutpass(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            var outpasses = outpass.toList();
            return ListView.builder(
                itemCount: outpasses.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 4,
                        margin: EdgeInsets.all(15),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: (outpass[index].status == true)
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
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Roll No: $rollno',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                            'Student Name: ' +
                                                outpass[index].name,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                            "Room No: " + outpass[index].roomno,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child:
                                            Text("Date: " + outpass[index].date,
                                                style: const TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child:
                                            Text("Time: " + outpass[index].time,
                                                style: const TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Reason: " + outpass[index].reason,
                                            style: const TextStyle(
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
                        )),
                  );
                });
          }),
    );
  }
}
