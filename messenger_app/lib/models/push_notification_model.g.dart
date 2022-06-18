// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationModel _$PushNotificationModelFromJson(
        Map<String, dynamic> json) =>
    PushNotificationModel(
      notification:
          Notification.fromJson(json['notification'] as Map<String, dynamic>),
      to: json['to'] as String,
    );

Map<String, dynamic> _$PushNotificationModelToJson(
        PushNotificationModel instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'to': instance.to,
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
