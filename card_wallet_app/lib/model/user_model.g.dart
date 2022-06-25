// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      password: json['password'] as String? ?? 'Default password',
      name: json['name'] as String? ?? 'Default name',
      email: json['email'] as String? ?? 'Default email',
      avatar: json['avatar'] as String? ?? 'assets/images/avatar.jpg',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
    };
