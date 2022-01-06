import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Parent/parent_home.dart';
import 'package:hostel_management/Parent/parent_login.dart';

// Create a Form widget.
class ParentLoginForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<ParentLoginForm> {
  final _formKey = GlobalKey<FormState>();
  String rollno = "";
  static bool isLogin = false;

  showMainScreen(BuildContext context) async {
    var studentDocRef =
        FirebaseFirestore.instance.collection('students').doc(rollno);
    var doc = await studentDocRef.get();

    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      if (doc.exists) {
        isLogin = true;
        return ParentHomeScreen(rollno: rollno);
      } else {
        return ParentLogin();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        child: Material(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text("PARENT LOGIN",
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
                      icon: Icon(Icons.person),
                      hintText: 'Enter your roll number',
                      labelText: 'Roll Number',
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter valid roll number';
                      }
                      rollno = value.toString();
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
                          showMainScreen(context);
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
  }
}
