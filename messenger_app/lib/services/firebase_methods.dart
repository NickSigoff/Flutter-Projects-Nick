import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/services/shared_preferences_methods.dart';
import 'package:messenger_app/utils/firebase_constants.dart';

class FirebaseMethods {
  Future getUserByName(String username) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .get();
    return data;
  }

  static void uploadUserInfo(
      {required String name, required String email}) async {
    //todo the Stick of death
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final userDocument = FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId);

    UserModel user = UserModel(
      name: name,
      email: email,
      id: userId,
    );
    await userDocument.set(user.toJson());

    await SharedPreferencesMethods.setUserLoggedInSharedPreferences(true);
    await SharedPreferencesMethods.setUserNameSharedPreferences(name);
    await SharedPreferencesMethods.setUserEmailSharedPreferences(email);
    await SharedPreferencesMethods.setUserIdSharedPreferences(userDocument.id);
  }

  static downloadUserInfo(String userId) async {
    final userMap = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .get();
    UserModel userModel = UserModel.fromJson(userMap.data()!);

    await SharedPreferencesMethods.setUserLoggedInSharedPreferences(true);
    await SharedPreferencesMethods.setUserNameSharedPreferences(userModel.name);
    await SharedPreferencesMethods.setUserEmailSharedPreferences(
        userModel.email);
    await SharedPreferencesMethods.setUserIdSharedPreferences(userModel.id);
  }
}
