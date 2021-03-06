import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'management_home_screen.dart';

class AddStudent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? name = "";
  String? phoneNo = "";
  String? fatherNo = "";
  String? rollno = "";

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Student is added!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'The student\'s data is successfully added to database.\n'),
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
                        builder: (BuildContext context) => new ManagementHomeScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.pink,
    ),
    body:Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        child: Material(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text("Add Student Details",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      icon: const Icon(Icons.person),
                      hintText: 'Enter student\'s name',
                      labelText: 'Student\'s Name',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid name';
                      }
                      name = value;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      icon: const Icon(Icons.person),
                      hintText: 'Enter student\'s roll number',
                      labelText: 'Student\'s Roll number',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid roll number';
                      }
                      rollno = value;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter student\'s phone number',
                      labelText: 'Phone number',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid phone number';
                      }
                      phoneNo = value;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter parent\'s phone number',
                      labelText: 'Parent\'s Phone number',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid phone number';
                      }
                      fatherNo = value;
                      return null;
                    },
                  ),
                  SizedBox(
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
                              .set({
                            'name': name,
                            'rollno': rollno,
                            'phoneNo': phoneNo,
                            'fatherNo': fatherNo
                          });
                          _showMyDialog(context);
                          //ManagementHomeScreen();
                        },
                        child: Padding(
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
    ),);
  }
}
