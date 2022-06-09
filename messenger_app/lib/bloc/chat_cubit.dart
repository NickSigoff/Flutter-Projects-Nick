import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  void downloadChats() {
    try {
      Stream<DocumentSnapshot<Map<String, dynamic>>> stream;
      stream = FirebaseService().getUserDataStream();
      emit(ChatDownloadedChats(stream: stream));
    } catch (e) {
      emit(ChatError());
    }
  }
}
