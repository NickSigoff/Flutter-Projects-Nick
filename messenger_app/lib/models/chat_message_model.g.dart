// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      messageTime: json['messageTime'] as String,
      messageContent: json['messageContent'] as String,
      messageSender: json['messageSender'] as String,
      messageTimeOrder: json['messageTimeOrder'] as String,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'messageContent': instance.messageContent,
      'messageSender': instance.messageSender,
      'messageTime': instance.messageTime,
      'messageTimeOrder': instance.messageTimeOrder,
    };