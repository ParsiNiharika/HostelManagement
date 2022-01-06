import 'package:cloud_firestore/cloud_firestore.dart';
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

  Outpass(
      {required this.name,
      required this.roomno,
      required this.bedno,
      required this.date,
      required this.time,
      required this.reason,
      required this.status,
      required this.parentAccepted});
}

class ParentHomeScreen extends StatefulWidget {
  final String? rollno;
  const ParentHomeScreen({Key? key, this.rollno}) : super(key: key);
  @override
  _ParentHomeScreenState createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
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
      var parentAccepted = doc["outpass"]["parentAccepted"];
      Outpass pass = Outpass(
        name: name,
        roomno: roomno,
        bedno: bedno,
        date: date,
        time: time,
        reason: reason,
        status: status,
        parentAccepted: parentAccepted,
      );
      outpass.add(pass);
    });
  }

  @override
  Widget build(BuildContext context) {
    rollno = widget.rollno;
    bool? _checked = false;
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
                        margin: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: (outpass[index].parentAccepted == false &&
                                  _checked == false)
                              ? Column(
                                  children: <Widget>[
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
                                    ElevatedButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('students')
                                            .doc(rollno)
                                            .update({
                                          "outpass": {
                                            "roomNo": outpass[index].roomno,
                                            "bedNo": outpass[index].bedno,
                                            "status": outpass[index].status,
                                            "date": outpass[index].date,
                                            "time": outpass[index].time,
                                            "reason": outpass[index].reason,
                                            "parentAccepted": true
                                          }
                                        });
                                        setState(() {
                                          _checked = true;
                                        });
                                      },
                                      child: const Text(
                                          "I Accept My child's Request"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : const Text("Outpass will be granted soon",
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
