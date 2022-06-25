import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'card_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
@immutable
class UserModel {
  final String name;
  final String email;
  final String password;
  final String avatar;
  final List<dynamic> cardList;

  const UserModel({
    this.cardList = const [],
    this.password = 'Default password',
    this.name = 'Default name',
    this.email = 'Default email',
    this.avatar = 'assets/images/avatar.jpg',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
