import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String id;
  final String? token;
  final List<String> chatRoomList;

  UserModel({
    this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.chatRoomList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith(
          {String? name,
          String? email,
          String? id,
          String? token,
          List<String>? chatRoomList}) =>
      UserModel(
          name: name ?? this.name,
          email: email ?? this.email,
          id: id ?? this.id,
          token: token ?? this.token,
          chatRoomList: chatRoomList ?? this.chatRoomList);
}
