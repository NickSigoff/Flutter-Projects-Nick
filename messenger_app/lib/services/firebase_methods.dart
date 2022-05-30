import 'package:cloud_firestore/cloud_firestore.dart';
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
    final userDocument = FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc();
    UserModel user = UserModel(
      name: name,
      email: email,
      id: userDocument.id,
    );
    await userDocument.set(user.toJson());

    SharedPreferencesMethods.setUserLoggedInSharedPreferences(true);
    SharedPreferencesMethods.setUserNameSharedPreferences(name);
    SharedPreferencesMethods.setUserEmailSharedPreferences(email);
    SharedPreferencesMethods.setUserIdSharedPreferences(userDocument.id);
  }

  static downloadUserInfo(String userId) async {
    final userMap = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .get();
    UserModel userModel = UserModel.fromJson(userMap.data()!);

    SharedPreferencesMethods.setUserLoggedInSharedPreferences(true);
    SharedPreferencesMethods.setUserNameSharedPreferences(userModel.name);
    SharedPreferencesMethods.setUserEmailSharedPreferences(userModel.email);
    SharedPreferencesMethods.setUserIdSharedPreferences(userModel.id);
  }
}
