import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ManagementLogin.dart';
import 'managemntHomeScreen.dart';



// Create a Form widget.
class ManagmentLoginForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<ManagmentLoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? name = "";
  String? password = "";
  static bool isLogin = false;

  showMainScreen(BuildContext context) {

    if(name == "1" && password == "1") {
      isLogin = true;
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new ManagementHomeScreen()));
    }else{
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new ManagementLogin()));
    }
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
        child:Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child:Text(
                      "LOGIN",
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
                          fillColor: Colors.white,
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your name',
                          labelText: 'Name',
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
                          icon: const Icon(Icons.vpn_key),
                          hintText: 'Enter password',
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter valid password';
                          }
                          password = value;
                          return null;
                        },
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
                              showMainScreen(context);
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
    ),
    );
  }
}