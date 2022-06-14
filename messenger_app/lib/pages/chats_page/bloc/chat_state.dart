part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatDownloadedChats extends ChatState {
  final List<UserChatModel> chatRoomModelList;

  ChatDownloadedChats({
    required this.chatRoomModelList,
  });
}

class ChatEmptyChats extends ChatState {
  final List<dynamic> chatRoomList;

  ChatEmptyChats({required this.chatRoomList});
}

class ChatError extends ChatState {}
