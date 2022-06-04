import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/services/firebase_methods.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchUser(String name) {
    List<QuerySnapshot> searchedUsers = [];
    FirebaseMethods.getUserByName(name).then((value) {
      if (value.docs.isNotEmpty) {
        searchedUsers.add(value);
      }
      emit(SearchFound(searchedUsers: searchedUsers));
    });
  }
}
