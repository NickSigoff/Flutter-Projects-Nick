part of 'current_message_cubit.dart';

@immutable
abstract class CurrentMessageState {}

class CurrentMessageLoading extends CurrentMessageState {}

class CurrentMessageLoaded extends CurrentMessageState {
  final String messageContent;
  final String messageTime;

  CurrentMessageLoaded({
    required this.messageContent,
    required this.messageTime,
  });
}

class CurrentMessageEmpty extends CurrentMessageState {}

class CurrentMessageError extends CurrentMessageState {}
