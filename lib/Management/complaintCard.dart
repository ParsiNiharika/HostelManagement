import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/carpenterComplaints.dart';
import 'package:hostel_management/Management/foodComplaints.dart';
import 'package:hostel_management/Management/othersComplaints.dart';
import 'package:hostel_management/Management/plumberComplaints.dart';

class ComplaintCard extends StatelessWidget {
  final String desc;
  final String RoomNo;
  final String isResloved;
  final String rollNo;
  final String category;

  ComplaintCard({
    required this.desc,
    required this.RoomNo,
    required this.isResloved,
    required this.rollNo,
    required this.category,
  });

  removeComplaint(BuildContext context, String rollNo) async {
   await FirebaseFirestore.instance
        .collection('Complaints')
        .doc(category)
        .collection(category)
        .doc(rollNo)
        .update({'isResloved': '1'});
    if(category=="plumber"){
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new Plumber()));
    }
    if(category=="carpenter"){
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new Carpenter()));
    }
   if(category=="food"){
     Navigator.pushReplacement(
         context,
         new MaterialPageRoute(
             builder: (BuildContext context) => new Food()));
   }
   if(category=="others"){
     Navigator.pushReplacement(
         context,
         new MaterialPageRoute(
             builder: (BuildContext context) => new Others()));
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Room No:" + RoomNo,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                // width: MediaQuery.of(context).size.width*0.5 ,
                child: Text(
                  desc,
                  maxLines: 100,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  removeComplaint(context, rollNo);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'Resolved',
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
          ],
        ),
      ),
    );
  }
}
