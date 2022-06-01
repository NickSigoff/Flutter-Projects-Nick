class ChatMessage {
  String messageContent;
  String messageSender;
  String messageTime;
  String messageTimeOrder;

  ChatMessage({
    required this.messageTime,
    required this.messageContent,
    required this.messageSender,
    required this.messageTimeOrder,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
      messageTimeOrder: json['messageTimeOrder'],
      messageTime: json['messageTime'],
      messageContent: json['messageContent'],
      messageSender: json['messageSender']);

  Map<String, dynamic> toJson() => {
        'messageTimeOrder': messageTimeOrder,
        'messageContent': messageContent,
        'messageSender': messageSender,
        'messageTime': messageTime,
      };
}
