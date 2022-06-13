import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/shared_preferences_service.dart';
import 'package:meta/meta.dart';

import '../../../services/firebase_service.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit() : super(ChatDetailLoading());

  void downLoadChatHistory({required String chatRoomId}) {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> chatStream =
          FirebaseService().getChatsStream(chatRoomId);

      StreamController<QuerySnapshot<Map<String, dynamic>>>
          chatStreamController = StreamController();

      chatStreamController.addStream(chatStream);
      chatStreamController.stream.listen((event) {
        List<dynamic> messagesList = event.docs;
        if (messagesList.isEmpty) {
          emit(ChatDetailEmpty());
        } else {
          emit(ChatDetailLoading());
          List<ChatMessage> messages = [];
          for (int i = 0; i < event.docs.length; i++) {
            messages.add(ChatMessage.fromJson(event.docs[i].data()));
          }
          emit(ChatDetailLoaded(
            messagesList: messages,
          ));
        }
      });
    } catch (e) {
      emit(ChatDetailError());
    }
  }

  Future<bool> saveMessageDraft({
    required String value,
    required String chatRoomId,
  }) async {
    print('save $value');
    String key = '${CurrentUserData.currentUserId}_$chatRoomId';
    await SharedPreferencesService()
        .setUserSharedPreferencesDraft(value: value, key: key);
    return true;
  }

  Future<String> getMessageDraft({required String chatRoomId}) async {
    String key = '${CurrentUserData.currentUserId}_$chatRoomId';
    String? draft =
        await SharedPreferencesService().getUserSharedPreferencesDraft(key);
    print('get $draft');
    return draft ?? '';
  }
}
