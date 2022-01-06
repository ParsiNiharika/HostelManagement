import 'package:flutter/material.dart';
import 'package:hostel_management/Student/student_outpass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentOutpassForm extends StatefulWidget {
  const StudentOutpassForm({Key? key}) : super(key: key);

  @override
  _StudentOutpassFormState createState() => _StudentOutpassFormState();
}

class _StudentOutpassFormState extends State<StudentOutpassForm> {
  DateTime? date = DateTime.now();
  TimeOfDay? time = const TimeOfDay(hour: 5, minute: 0);
  String? reason = "";
  String? bedNo = "";
  String? roomNo = "";
  String? rollno = "";

  final _formKey = GlobalKey<FormState>();

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Outpass is Requested'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('It will be processed soon\n'),
                Text('Please click \'OK\' to continue.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {

                Navigator.of(context)
                    .pop(MaterialPageRoute(builder: (_) {
                  return const AlertDialog();
                }));
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new StudentOutpass()));

              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        height: 200,
        width: 300,
        child: Material(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text("Request Outpass",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //First we take the student roll no
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      icon: Icon(Icons.person),
                      hintText: 'Enter your roll number',
                      labelText: 'Student Roll number',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid roll number';
                      }
                      rollno = value;
                      return null;
                    },
                  ),

                  //This is to provide a bit of padding
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.home),
                      hintText: 'Enter Room.No',
                      labelText: 'Room.No',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid phone number';
                      }
                      roomNo = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.bed_outlined),
                      hintText: 'Enter Bed.No',
                      labelText: 'Bed.No',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid phone number';
                      }
                      bedNo = value;
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // //we must have a row that contains datepicker
                  Text('${date?.day} ${date?.month} ${date?.year}'),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023));
                        if (newDate != null) {
                          setState(() {
                            date = newDate;
                          });
                        }
                      },
                      child: const Text("Select Date")),

                  const SizedBox(
                    height: 20,
                  ),
                  Text('${time!.hour.toString()}:${time!.minute.toString()}'),
                  ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 12, minute: 0));
                        if (newTime != null) {
                          setState(() {
                            time = newTime;
                          });
                        }
                      },
                      child: const Text("Select Time")),

                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      icon: Icon(Icons.phone),
                      hintText: 'Enter Reason',
                      labelText: 'Reason',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid reason';
                      }
                      reason = value;
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      // child: ConstrainedBox(
                      // constraints:
                      //     BoxConstraints.tightFor(width: 250, height: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form != null && !form.validate()) {
                            return;
                          }
                          form?.save();
                          FirebaseFirestore.instance
                              .collection('students')
                              .doc(rollno)
                              .update({
                            'outpass': {
                              'roomNo': roomNo,
                              'bedNo': bedNo,
                              'date':
                                  '${date?.day} ${date?.month} ${date?.year}',
                              'time':
                                  '${time!.hour.toString()}:${time!.minute.toString()}',
                              'reason': reason,
                              'parentAccepted': false,
                              'status': false,
                            }
                          });
                          _showMyDialog(context);
                          //ManagementHomeScreen();
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            'Submit',
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
            ),
          ],
        )),
      ),
    );
    ;
  }
}
