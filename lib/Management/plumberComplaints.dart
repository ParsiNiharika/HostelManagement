// ignore: file_names
// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management/Management/Complaints.dart';
import './complaintCard.dart';

class Complaint {
  final String desc;
  final String RoomNo;
  final String isResloved;
  final String rollNo;

  Complaint({
    required this.desc,
    required this.RoomNo,
    required this.isResloved,
    required this.rollNo,
  });
}

class Plumber extends StatelessWidget {
  List<Complaint> complaintData = [];

  Future<void> getComplaints() async {
    await FirebaseFirestore.instance
        .collection('Complaints')
        .doc('plumber')
        .collection('plumber')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var Desc = doc["Desc"];
        var RoomNo = doc["RoomNo"];
        var isResloved = doc["isResloved"];
        var rollNo = doc["rollNo"];
        if (isResloved != '1') {
          Complaint complaint = Complaint(
            desc: Desc,
            RoomNo: RoomNo,
            isResloved: isResloved,
            rollNo: rollNo,
          );
          complaintData.add(complaint);
        }
      });
    });
  }

  removeComplaint(Complaint complaint, BuildContext context) {
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new ComplaintCard(
                desc: complaint.desc,
                RoomNo: complaint.RoomNo,
                isResloved: complaint.isResloved,
                rollNo: complaint.rollNo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "PLUMBER",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<void>(
          future: getComplaints(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            var complaintList = complaintData.toList();
            DateTime now = new DateTime.now();
            DateTime date = new DateTime(now.day);
            print(now.weekday);
            return ListView.builder(
                itemCount: complaintList.length,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Room No:" + complaintList[index].RoomNo,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(top: 12),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    complaintList[index].desc,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 5),
                                    child: InkWell(
                                        onTap: () => {
                                              removeComplaint(
                                                  complaintList[index], context)
                                            },
                                        child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              "Resloved",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.lightBlue,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ))))
                              ],
                            ),
                          )));
                });
          }),
    );
  }
}
