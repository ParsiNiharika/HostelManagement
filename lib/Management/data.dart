import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> getStudentChapters() async {
  await FirebaseFirestore.instance
      .collection('StudentChapters')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc["id"]);
    });
  });
}