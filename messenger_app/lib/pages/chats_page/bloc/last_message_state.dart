part of 'last_message_cubit.dart';

@immutable
abstract class LastMessageState {}

class LastMessageInitial extends LastMessageState {}

class LastMessageLoading extends LastMessageState {}

class LastMessageLoaded extends LastMessageState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> las;

  LastMessageLoaded({required this.las});
}

class LastMessageEmpty extends LastMessageState {}

class LastMessageError extends LastMessageState {}
