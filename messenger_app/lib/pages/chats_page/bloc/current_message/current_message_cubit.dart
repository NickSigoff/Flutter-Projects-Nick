import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../services/firebase_service.dart';

part 'current_message_state.dart';

class CurrentMessageCubit extends Cubit<CurrentMessageState> {
  CurrentMessageCubit() : super(CurrentMessageLoading());

  void downloadCurrentChat(String chatRoomId) {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> stream =
          FirebaseService().getChatsStream(chatRoomId);

      StreamController<QuerySnapshot<Map<String, dynamic>>> controller =
          StreamController();

      controller.addStream(stream);
      controller.stream.listen((event) {
        if (event.docs.isEmpty) {
          emit(CurrentMessageEmpty());
        } else {
          emit(CurrentMessageLoading());
          String messageContent = event.docs.last.get('messageContent');
          String messageTime = event.docs.last.get('messageTime');
          emit(CurrentMessageLoaded(
            messageContent: messageContent,
            messageTime: messageTime,
          ));
        }
      });
    } catch (e) {
      emit(CurrentMessageError());
    }
  }
}
