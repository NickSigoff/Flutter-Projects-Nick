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
  static DocumentReference<Map<String, dynamic>> getUserById(String userId) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId);
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
  static String createChatRoomAddToUsersList({
    required String searchedUserId,
    required String currentUserId,
  }) {
    String chatRoomId = _createChatRoomId(
        searchedUserId: searchedUserId, currentUserId: currentUserId);
    _createChatRoom(
      currentUserId: currentUserId,
      searchedUserId: searchedUserId,
      chatRoomId: chatRoomId,
    );
    _addChatRoomToList(chatRoomId: chatRoomId, userId: currentUserId);
    _addChatRoomToList(chatRoomId: chatRoomId, userId: searchedUserId);
    return chatRoomId;
  }

  ///
  static String _createChatRoomId({
    required String currentUserId,
    required String searchedUserId,
  }) {
    return currentUserId.compareTo(searchedUserId) > 0
        ? '$currentUserId\_$searchedUserId'
        : '$searchedUserId\_$currentUserId';
  }

  ///
  static void _createChatRoom({
    required String currentUserId,
    required String searchedUserId,
    required String chatRoomId,
  }) async {
    List<String> chatRoomUsers = [currentUserId, searchedUserId];

    Map<String, dynamic> chatRoom = {
      'users': chatRoomUsers,
      'chatRoomId': chatRoomId,
    };
    FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .set(chatRoom);
  }

  ///
  //todo is there a simple way?
  static void _addChatRoomToList({
    required String chatRoomId,
    required String userId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> userMap = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .get();

    UserModel userModel = UserModel.fromJson(userMap.data()!);
    if (userModel.chatRoomList.isEmpty) {
      userModel.chatRoomList.add(chatRoomId);
    } else {
      for (String chatRoomIdFromList in userModel.chatRoomList) {
        if (chatRoomIdFromList.compareTo(chatRoomId) == 0) {
          return;
        } else {
          continue;
        }
      }
      userModel.chatRoomList.add(chatRoomId);
    }

    await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .set(userModel.toJson());
  }

  ///
  static void addMessage({
    required String chatRoomId,
    required ChatMessage chatMessage,
  }) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc()
        .set(chatMessage.toJson());
  }

  ///
  static Stream<QuerySnapshot<Map<String, dynamic>>> getChatsStream(
    String chatRoomId,
  ) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('messageTimeOrder')
        .snapshots();
  }

  ///
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream(
    String currentUserId,
  ) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(currentUserId)
        .snapshots();
  }
}
