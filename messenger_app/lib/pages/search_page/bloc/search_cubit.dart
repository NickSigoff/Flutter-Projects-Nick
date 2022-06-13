import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:meta/meta.dart';

import '../../../services/current_user_data.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  String createChatRoom({required searchedUserId}) {
    return FirebaseService().createChatRoomAddToUsersList(
      searchedUserId: searchedUserId,
      currentUserId: CurrentUserData.currentUserId,
    );
  }

  void searchUser(String name) {
    List<QuerySnapshot> searchedUsers = [];
    FirebaseService().getUserByName(name).then((value) {
      if (value.docs.isNotEmpty) {
        searchedUsers.add(value);
      }
      emit(SearchFound(searchedUsers: searchedUsers));
    });
  }
}
