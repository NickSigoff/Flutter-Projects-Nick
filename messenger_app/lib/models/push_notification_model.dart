import 'package:json_annotation/json_annotation.dart';

part 'push_notification_model.g.dart';

@JsonSerializable()
class PushNotificationModel {
  Notification notification;
  String to;

  PushNotificationModel({required this.notification, required this.to});

  factory PushNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationModelToJson(this);
}

@JsonSerializable()
class Notification {
  String title;
  String body;

  Notification({required this.title, required this.body});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
