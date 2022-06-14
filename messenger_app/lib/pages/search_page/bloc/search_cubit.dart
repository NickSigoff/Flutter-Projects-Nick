import 'package:bloc/bloc.dart';
import 'package:messenger_app/models/chat_room_model.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:meta/meta.dart';

import '../../../services/current_user_data.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchUser(String name) {
    List<ChatRoomModel> chatRoomList = [];

    FirebaseService().getUserByName(name).then((value) {
      if (value.docs.isNotEmpty) {
        var doc = value.docs.first;
        String chatRoomId = FirebaseService().createChatRoomId(
            currentUserId: CurrentUserData.currentUserId,
            searchedUserId: doc.get('id'));

        chatRoomList.add(ChatRoomModel(
          anotherUserEmail: doc.get('email'),
          anotherUserImageUrl: 'assets/images/avatars/11.jpg',
          anotherUserName: doc.get('name'),
          chatRoomId: chatRoomId,
          anotherUserId: doc.get('id'),
        ));
      }
      emit(SearchFound(chatRoomList: chatRoomList));
    });
  }

  void tapMessageButton({required String userId}) {
    FirebaseService().createChatRoomAddToUsersList(
      searchedUserId: userId,
      currentUserId: CurrentUserData.currentUserId,
    );
  }
}
