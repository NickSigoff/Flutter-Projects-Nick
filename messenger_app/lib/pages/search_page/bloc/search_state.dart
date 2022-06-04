part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {
  final List<QuerySnapshot> searchedUsers = [];
}

class SearchFound extends SearchState {
  final List<QuerySnapshot> searchedUsers;

  SearchFound({required this.searchedUsers});
}
