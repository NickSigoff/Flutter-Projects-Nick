import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/services/firebase_methods.dart';
import 'package:meta/meta.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  String getAnotherUser(
      {required String chatRoomId, required String currentUserId}) {
    List<String> users = chatRoomId.split('_');
    return users[0].compareTo(currentUserId) == 0 ? users[1] : users[0];
  }

  void getDataStream(String userId) {
    Stream<DocumentSnapshot>? userDataStream =
        FirebaseMethods.getUserDataStream(userId);

    emit(ChatsEnabledChats(userDataStream: userDataStream));
    print('in');
  }

  void ff() {
    emit(ChatsInitial());
  }
}
