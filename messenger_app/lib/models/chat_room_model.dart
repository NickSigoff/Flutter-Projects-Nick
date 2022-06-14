class ChatRoomModel {
  final String anotherUserName;
  final String anotherUserEmail;
  final String anotherUserId;
  final String anotherUserImageUrl;
  final String chatRoomId;

  ChatRoomModel({
    required this.anotherUserEmail,
    required this.anotherUserImageUrl,
    required this.anotherUserId,
    required this.anotherUserName,
    required this.chatRoomId,
  });
}
