import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/services/shared_preferences_methods.dart';
import 'package:messenger_app/utils/firebase_constants.dart';

class FirebaseMethods {
  Future getUserByName(String username) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
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

  static void createChatRoom({required String userName}) async {
    String? myName =
        await SharedPreferencesMethods.getUserNameSharedPreferences();
    if (myName == null) {
      throw Exception();
    } else {
      List<String> chatRoomUsers = [userName, myName];
      String chatRoomId = createChatRoomId(userName, myName);
      Map<String, dynamic> chatRoom = {
        'users': chatRoomUsers,
        'chatRoomId': chatRoomId,
      };
      FirebaseMethods._addChatRoom(chatRoomId: chatRoomId, chatRoom: chatRoom);
    }
  }

  static String createChatRoomId(String userOne, String userTwo) {
    return userOne.codeUnitAt(0) > userTwo.codeUnitAt(0)
        ? '$userOne\_$userTwo'
        : '$userTwo\_$userOne';
  }

  static void _addChatRoom(
      {required dynamic chatRoom, required String chatRoomId}) {
    FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) => print(e));
  }

  static void addMessage(
      {required String chatRoomId, required ChatMessage chatMessage}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc()
        .set(chatMessage.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getChats(
      String chatRoomId) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('messageTimeOrder')
        .snapshots();
    // .orderBy('time')
    // .snapshots();
  }
}
