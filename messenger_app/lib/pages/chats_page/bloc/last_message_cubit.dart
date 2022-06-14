import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'last_message_state.dart';

class LastMessageCubit extends Cubit<LastMessageState> {
  LastMessageCubit() : super(LastMessageInitial());

  void downloadLastMessage(String charRoomId) {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> stream =
          FirebaseService().getLastMessageStream();

      StreamController<QuerySnapshot<Map<String, dynamic>>> controller =
          StreamController();

      controller.addStream(stream);
      controller.stream.listen((event) {
        List<dynamic> lastMessagesList = event.docs;
        if (lastMessagesList.isEmpty) {
          emit(LastMessageEmpty());
        } else {
          emit(LastMessageLoading());
          emit(LastMessageLoaded(lastMessagesList: event.docs));
        }
      });
    } catch (e) {
      emit(LastMessageError());
    }
  }
}
