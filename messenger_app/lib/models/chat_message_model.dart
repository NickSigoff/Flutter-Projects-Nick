
class ChatMessage {
  String messageContent;
  String messageSender;
  String messageTime;

  ChatMessage({
    required this.messageTime,
    required this.messageContent,
    required this.messageSender,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
      messageTime: json['messageTime'],
      messageContent: json['messageContent'],
      messageSender: json['messageSender']);

  Map<String, dynamic> toJson() => {
        'messageContent': messageContent,
        'messageSender': messageSender,
        'messageTime': messageTime,
      };
}
