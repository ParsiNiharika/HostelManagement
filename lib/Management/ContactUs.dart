import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "CONTACT US",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.phone,size: 25,),
                Text(
                  '040-23731555',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.mail,size: 25,),
                Text(
                  'vnrhostel@vnrvjiet.in',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),

        ],
      )),
    );
  }
}
