class ChatRoomModel {
  final String anotherUserName;
  final String anotherUserEmail;
  final String anotherUserImageUrl;
  final String chatRoomId;

  ChatRoomModel({
    required this.anotherUserEmail,
    required this.anotherUserImageUrl,
    required this.anotherUserName,
    required this.chatRoomId,
  });
}
