import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/services/shared_preferences_methods.dart';
import 'package:messenger_app/utils/firebase_constants.dart';

class FirebaseMethods {
  ///
  static Future<QuerySnapshot<Map<String, dynamic>>> getUserByName(
      String username) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .where('name', isEqualTo: username)
        .get();
    return data;
  }

  ///
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
      chatRoomList: [],
    );
    await userDocument.set(user.toJson());

    await SharedPreferencesMethods.setUserLoggedInSharedPreferences(true);
    await SharedPreferencesMethods.setUserNameSharedPreferences(name);
    await SharedPreferencesMethods.setUserEmailSharedPreferences(email);
    await SharedPreferencesMethods.setUserIdSharedPreferences(userDocument.id);
  }

  ///
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

  ///
  static void createChatRoom(
      {required String currentUserName,
      required String searchedUserName}) async {
    List<String> chatRoomUsers = [currentUserName, searchedUserName];
    String chatRoomId = createChatRoomId(currentUserName, searchedUserName);
    Map<String, dynamic> chatRoom = {
      'users': chatRoomUsers,
      'chatRoomId': chatRoomId,
    };
    FirebaseMethods._addChatRoom(chatRoomId: chatRoomId, chatRoom: chatRoom);
  }

  ///
  static String createChatRoomId(String userOne, String userTwo) {
    return userOne.codeUnitAt(0) > userTwo.codeUnitAt(0)
        ? '$userOne\_$userTwo'
        : '$userTwo\_$userOne';
  }

  ///
  static void _addChatRoom(
      {required dynamic chatRoom, required String chatRoomId}) {
    FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .set(chatRoom);
  }

  ///
  static void addMessage(
      {required String chatRoomId, required ChatMessage chatMessage}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc()
        .set(chatMessage.toJson());
  }

  ///
  static Stream<QuerySnapshot<Map<String, dynamic>>> getChats(
      String chatRoomId) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('messageTimeOrder')
        .snapshots();
  }

  //todo is there a simple way?
  static void addChatRoomToList(
      {required String chatRoomId, required String userId}) async {
    DocumentSnapshot<Map<String, dynamic>> userMap = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .get();

    UserModel userModel = UserModel.fromJson(userMap.data()!);
    userModel.chatRoomList.add(chatRoomId);

    await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .set(userModel.toJson());
  }
}
