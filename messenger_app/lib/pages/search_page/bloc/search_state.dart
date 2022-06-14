part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {
  final List<ChatRoomModel> chatRoomList = [];
}

class SearchFound extends SearchState {
  final List<ChatRoomModel> chatRoomList;

  SearchFound({required this.chatRoomList});
}
