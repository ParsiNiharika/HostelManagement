import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:hostel_management/Student/student_outpass_form.dart';

import 'StudentHomeScreen.dart';

class StudentComplaint extends StatelessWidget {
    final _formKey = GlobalKey<FormState>();
    String? RoomNo = "";
    String? Desc = "";
    String? rollNo = "";
    String category="";

    Future<void> _showMyDialog(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Complaint is added!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('The complaint is registered successfully\n'),
                  Text('Please click \'OK\' to continue.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK',style: TextStyle(fontSize: 20),),
                onPressed: () {
                  Navigator.of(context)
                      .pop(MaterialPageRoute(builder: (_) {
                    return const AlertDialog();
                  }));
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new StudentHomeScreen()));
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
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          child:Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child:Text(
                        "Add Complaint",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.phone),
                            hintText: 'Enter Category ',
                            labelText: 'Category',
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter valid Category';
                            }
                            category = value!;
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
                            hintText: 'Enter rollNo name',
                            labelText: 'Roll NO',
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter valid roll no';
                            }
                            rollNo = value;
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
                            hintText: 'Enter complaint description',
                            labelText: 'Compalint desc',
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter valid desc';
                            }
                            Desc = value;
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.phone),
                            hintText: 'Enter Room No',
                            labelText: 'Room No',
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter valid room number';
                            }
                            RoomNo = value;
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
                              onPressed: (){
                                final form = _formKey.currentState;
                                if (form != null && !form.validate()) {
                                  return;
                                }
                                form?.save();
                                FirebaseFirestore.instance
                                    .collection('Complaints')
                                    .doc(category)
                                    .collection(category)
                                    .doc(rollNo)
                                    .set({'Desc': Desc, 'rollNo': rollNo, 'RoomNo': RoomNo, 'isResloved': '0'});
                                _showMyDialog(context);
                                //ManagementHomeScreen();
                              } ,
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
                  ),],
              )
          ),
        ),
      );
    }
  }