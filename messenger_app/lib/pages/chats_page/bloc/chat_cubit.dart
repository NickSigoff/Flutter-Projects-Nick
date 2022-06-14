import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/models/chat_room_model.dart';
import 'package:messenger_app/models/user_chat_model.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:meta/meta.dart';

import '../../../models/chat_message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatLoading());

  void downloadChats() {
    try {
      Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
          FirebaseService().getChatRoomStream();

      StreamController<DocumentSnapshot<Map<String, dynamic>>> controller =
          StreamController();

      controller.addStream(stream);
      controller.stream.listen((event) async {
        List<dynamic> chatRoomList = event.get('chatRoomList');
        if (chatRoomList.isEmpty) {
          emit(ChatEmptyChats(chatRoomList: chatRoomList));
        } else {
          emit(ChatLoading());
          List<UserChatModel> chatRoomModelList =
              await _createUserChatModelList(chatRoomList);

          emit(ChatDownloadedChats(chatRoomModelList: chatRoomModelList));
        }
      });
    } catch (e) {
      emit(ChatError());
    }
  }

  Future<List<UserChatModel>> _createUserChatModelList(
    List<dynamic> chatRoomList,
  ) async {
    List<UserChatModel> chatRoomModelList = [];
    for (int i = 0; i < chatRoomList.length; i++) {
      String chatRoomId = chatRoomList[i];
      String anotherUserId = _getAnotherUser(
          chatRoomId: chatRoomId, currentUserId: CurrentUserData.currentUserId);

      DocumentSnapshot<Map<String, dynamic>> anotherUser =
          await FirebaseService().getUserById(anotherUserId);

      ChatRoomModel chatRoomModel = ChatRoomModel(
          anotherUserId: anotherUser.get('id'),
          anotherUserEmail: anotherUser.get('email'),
          anotherUserImageUrl: 'assets/images/avatars/11.jpg',
          anotherUserName: anotherUser.get('name'),
          chatRoomId: chatRoomId);

      ChatMessage? lastMessage =
          await FirebaseService().getLastMessage(chatRoomId);

      chatRoomModelList.add(
          UserChatModel(chatRoom: chatRoomModel, lastMessage: lastMessage));
    }
    return chatRoomModelList;
  }

  String _getAnotherUser(
      {required String chatRoomId, required String currentUserId}) {
    List<String> users = chatRoomId.split('_');
    return users[0].compareTo(currentUserId) == 0 ? users[1] : users[0];
  }
}
