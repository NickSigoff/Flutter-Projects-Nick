import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/push_notification_service.dart';
import 'package:messenger_app/services/shared_preferences_service.dart';
import 'package:messenger_app/utils/firebase_constants.dart';

class FirebaseService {
  ///
  Future<QuerySnapshot<Map<String, dynamic>>> getUserByName(
      String username) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .where('name', isNotEqualTo: CurrentUserData.currentUser.name)
        .where('name', isEqualTo: username)
        .get();
  }

  ///
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserById(String userId) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId)
        .get();
  }

  ///
  Future<void> uploadUserInfo(
      {required String name, required String email}) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final userDocument = FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(userId);

    String? token = await FirebaseMessaging.instance.getToken();

    UserModel user = UserModel(
      name: name,
      email: email,
      id: userId,
      token: token,
      chatRoomList: [],
    );
    Map<String, dynamic> userToJson = user.toJson();
    await userDocument.set(userToJson);
    await SharedPreferencesService()
        .setUserInfoSharedPreferences(jsonEncode(userToJson));
  }

  ///
  Future<void> downloadUserInfo() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userMap = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(currentUser!.uid)
        .get();

    UserModel userModel = UserModel.fromJson(userMap.data()!);
    await SharedPreferencesService()
        .setUserInfoSharedPreferences(jsonEncode(userModel.toJson()));
  }

  ///
  Future<void> processGoogleUserInfo() async {
    String? token = await FirebaseMessaging.instance.getToken();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (googleUser == null || currentUser == null) {
      throw Exception();
    } else {
      String userId = currentUser.uid;
      final userDocument = FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollectionName)
          .doc(userId);
      UserModel userModel;
      var docSnapshot = await userDocument.get();
      if (docSnapshot.exists) {
        userModel = UserModel.fromJson(docSnapshot.data()!);
      } else {
        userModel = UserModel(
          name: googleUser.displayName ?? 'Google name',
          email: googleUser.email,
          id: userId,
          token: token,
          chatRoomList: [],
        );
      }
      Map<String, dynamic> userToJson = userModel.toJson();
      await userDocument.set(userToJson);
      await SharedPreferencesService()
          .setUserInfoSharedPreferences(jsonEncode(userModel.toJson()));
    }
  }

  ///
  String createChatRoomAddToUsersList({
    required String searchedUserId,
    required String currentUserId,
  }) {
    String chatRoomId = createChatRoomId(
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
  String createChatRoomId({
    required String currentUserId,
    required String searchedUserId,
  }) {
    return currentUserId.compareTo(searchedUserId) > 0
        ? '${currentUserId}_$searchedUserId'
        : '${searchedUserId}_$currentUserId';
  }

  ///
  void _createChatRoom({
    required String currentUserId,
    required String searchedUserId,
    required String chatRoomId,
  }) {
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
  Future<void> _addChatRoomToList({
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
  Future<void> addMessage({
    required String chatRoomId,
    required ChatMessage chatMessage,
  }) async {
    await pushNotification(
        chatRoomId: chatRoomId, message: chatMessage.messageContent);

    await FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc()
        .set(chatMessage.toJson());
    await FirebaseFirestore.instance
        .collection('last_messages')
        .doc(chatRoomId)
        .set(chatMessage.toJson());
  }

  ///
  Future<void> pushNotification(
      {required String chatRoomId, required String message}) async {
    List<String> users = chatRoomId.split('_');
    String anotherUserId =
        users[0].compareTo(CurrentUserData.currentUser.id) == 0
            ? users[1]
            : users[0];
    DocumentSnapshot<Map<String, dynamic>> anotherUser =
        await FirebaseService().getUserById(anotherUserId);
    String anotherUserToken = anotherUser.get('token');
    await PushNotificationService().push(
        to: anotherUserToken,
        title: 'Message from ${CurrentUserData.currentUser.name}',
        body: message);
  }

  ///
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessageStream(
      String chatRoomId) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('order')
        .snapshots();
  }

  ///
  Stream<DocumentSnapshot<Map<String, dynamic>>> getChatRoomStream() {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(CurrentUserData.currentUser.id)
        .snapshots();
  }

  ///
  Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessageStream() {
    return FirebaseFirestore.instance.collection('last_messages').snapshots();
  }
}
