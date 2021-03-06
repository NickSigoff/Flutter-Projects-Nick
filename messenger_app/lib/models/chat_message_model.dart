import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessage {
  String messageContent;
  String messageSender;
  String messageTime;
  int order;

  ChatMessage({
    required this.messageTime,
    required this.messageContent,
    required this.messageSender,
    required this.order,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
