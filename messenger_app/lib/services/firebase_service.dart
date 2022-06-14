import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/models/user_model.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/shared_preferences_service.dart';
import 'package:messenger_app/utils/firebase_constants.dart';

class FirebaseService {
  ///
  Future<QuerySnapshot<Map<String, dynamic>>> getUserByName(
      String username) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .where('name', isNotEqualTo: CurrentUserData.currentUserName)
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
    //todo the Stick of death
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
    await userDocument.set(user.toJson());

    await SharedPreferencesService().setUserNameSharedPreferences(name);
    await SharedPreferencesService().setUserEmailSharedPreferences(email);
    await SharedPreferencesService()
        .setUserIdSharedPreferences(userDocument.id);
  }

  ///
  Future<bool> downloadUserInfo() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userMap = await FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(currentUser!.uid)
        .get();

    UserModel userModel = UserModel.fromJson(userMap.data()!);
    await SharedPreferencesService()
        .setUserNameSharedPreferences(userModel.name);
    await SharedPreferencesService()
        .setUserEmailSharedPreferences(userModel.email);
    await SharedPreferencesService().setUserIdSharedPreferences(userModel.id);
    await SharedPreferencesService().setCurrentsUser();
    return true;
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
    ///push
    //print(chatRoomId);
    // List<String> users = chatRoomId.split('_');
    // String anotherUserId =
    // users[0].compareTo(CurrentUserData.currentUserId) == 0
    //     ? users[1]
    //     : users[0];
    // DocumentSnapshot<Map<String, dynamic>> anotherUser =
    // await FirebaseService().getUserById(anotherUserId);
    // String anotherUserToken = anotherUser.get('token');
    //print(anotherUserToken);
    // FirebaseMessaging.instance.sendMessage(
    //   to: anotherUserToken,
    //   data:{},
    // );
    ///push
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc()
        .set(chatMessage.toJson());
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc('lastMessage')
        .set(chatMessage.toJson());
  }

  ///
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessageStream(
      String chatRoomId) {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('messageTimeOrder')
        .snapshots();
  }

  ///
  Stream<DocumentSnapshot<Map<String, dynamic>>> getChatRoomStream() {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollectionName)
        .doc(CurrentUserData.currentUserId)
        .snapshots();
  }

  ///
  Future<ChatMessage?> getLastMessage(String chatRoomId) async {
    DocumentSnapshot<Map<String, dynamic>> lastMessage = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.chatRoomName)
        .doc(chatRoomId)
        .collection('messages')
        .doc('lastMessage')
        .get();

    return lastMessage.data() == null
        ? null
        : ChatMessage.fromJson(lastMessage.data()!);
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    await SharedPreferencesService()
        .setUserNameSharedPreferences('Default name');
    await SharedPreferencesService()
        .setUserEmailSharedPreferences('Default email');
    await SharedPreferencesService().setUserIdSharedPreferences('Default id');
  }
}
