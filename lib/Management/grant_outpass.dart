import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Outpass {
  final String reason;
  final String roomno;
  final String bedno;
  final String date;
  final String time;
  final bool status;
  final String name;
  final bool parentAccepted;
  final String rollno;

  Outpass(
      {required this.rollno,
      required this.name,
      required this.roomno,
      required this.bedno,
      required this.date,
      required this.time,
      required this.reason,
      required this.status,
      required this.parentAccepted});
}

class GrantOutpass extends StatefulWidget {
  const GrantOutpass({Key? key}) : super(key: key);
  @override
  _GrantOutpassState createState() => _GrantOutpassState();
}

class _GrantOutpassState extends State<GrantOutpass> {
  List<Outpass> outpass = [];
  Future<void> getOutpass() async {
    await FirebaseFirestore.instance
        .collection('students')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var reason = doc["outpass"]["reason"];
        var roomno = doc["outpass"]["roomNo"];
        var bedno = doc["outpass"]["bedNo"];
        var date = doc["outpass"]["date"];
        var time = doc["outpass"]["time"];
        var status = doc["outpass"]["status"];
        var name = doc['name'];
        var parentAccepted = doc["outpass"]["parentAccepted"];
        var rollno = doc["rollno"];

        Outpass pass = Outpass(
          rollno: rollno,
          name: name,
          roomno: roomno,
          bedno: bedno,
          date: date,
          time: time,
          reason: reason,
          status: status,
          parentAccepted: parentAccepted,
        );
        if (pass.status == false && pass.parentAccepted == true) {
          outpass.add(pass);
        }
      });
    });
  }

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
      body: FutureBuilder<void>(
          future: getOutpass(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            var outpasses = outpass.toList();
            return CupertinoScrollbar(
              child: ListView.builder(
                  itemCount: outpasses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 4,
                          margin: const EdgeInsets.all(15),
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Roll No: ' + outpass[index].rollno,
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
                                  ElevatedButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('students')
                                            .doc(outpass[index].rollno)
                                            .update({
                                          "outpass": {
                                            "roomNo": outpass[index].roomno,
                                            "bedNo": outpass[index].bedno,
                                            "status": true,
                                            "date": outpass[index].date,
                                            "time": outpass[index].time,
                                            "reason": outpass[index].reason,
                                            "parentAccepted": true
                                          }
                                        });
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const GrantOutpass()));
                                      },
                                      child: const Text("Grant"))
                                ],
                              ))),
                    );
                  }),
            );
          }),
    );
  }
}
