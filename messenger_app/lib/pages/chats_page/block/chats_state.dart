part of 'chats_cubit.dart';

@immutable
abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class ChatsEnabledChats extends ChatsState {
  final Stream<DocumentSnapshot> userDataStream;

  ChatsEnabledChats({required this.userDataStream});
}
