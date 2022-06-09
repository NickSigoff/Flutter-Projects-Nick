part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatDownloadedChats extends ChatState {
  final Stream<DocumentSnapshot<Map<String, dynamic>>> stream;

  ChatDownloadedChats({required this.stream});
}

class ChatError extends ChatState {}
