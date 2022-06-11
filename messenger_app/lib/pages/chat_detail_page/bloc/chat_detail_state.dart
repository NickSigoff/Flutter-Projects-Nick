part of 'chat_detail_cubit.dart';

@immutable
abstract class ChatDetailState {}

class ChatDetailLoading extends ChatDetailState {}

class ChatDetailLoaded extends ChatDetailState {
  final List<ChatMessage> messagesList;

  ChatDetailLoaded({required this.messagesList});
}

class ChatDetailEmpty extends ChatDetailState {}

class ChatDetailError extends ChatDetailState {}
