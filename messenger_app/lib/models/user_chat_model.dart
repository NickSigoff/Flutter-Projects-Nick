import 'chat_message_model.dart';
import 'chat_room_model.dart';

class UserChatModel {
  final ChatMessage? lastMessage;
  final ChatRoomModel chatRoom;

  UserChatModel({required this.chatRoom, required this.lastMessage});
}
