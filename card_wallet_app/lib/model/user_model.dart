import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String avatar;

  UserModel({
    this.password = 'Default password',
    this.name = 'Default name',
    this.email = 'Default email',
    this.avatar = 'assets/images/avatar.jpg',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
