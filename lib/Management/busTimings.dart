import 'package:flutter/material.dart';

class BusTimings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "BUS TIMINGS",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  "Morning Bus Timings",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "8:00 AM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "8:30 AM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "9:00 AM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "9:30 AM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "10:00 AM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  "Evening Bus Timings",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "3:30 PM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "4:00 PM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "4:30 PM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "5:00 PM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "5:30 PM",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
