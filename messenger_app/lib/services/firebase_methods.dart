import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethods {
  Future getUserByName(String username) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .get();
    return data;
  }

  static void uploadUserInfo(Map<String, dynamic> userMap) {
    FirebaseFirestore.instance.collection('users').add(userMap);
  }

  static Future downloadUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
  }
}
