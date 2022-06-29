// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      cardModelList: (json['cardModelList'] as List<dynamic>?)
              ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'cardModelList': instance.cardModelList,
    };

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']) ??
          CardType.undefinedCard,
      cardNumber: json['cardNumber'] as String? ?? '0000000000000000',
      colorValue: json['colorValue'] as int? ?? 4289045928,
      balance: json['balance'] as int? ?? 0,
      cardOwner: json['cardOwner'] as String? ?? 'Default Name',
      validity: json['validity'] as String? ?? '00/00',
      cssNumber: json['cssNumber'] as String? ?? '000',
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'cardType': _$CardTypeEnumMap[instance.cardType],
      'colorValue': instance.colorValue,
      'balance': instance.balance,
      'cardOwner': instance.cardOwner,
      'validity': instance.validity,
      'cardNumber': instance.cardNumber,
      'cssNumber': instance.cssNumber,
    };

const _$CardTypeEnumMap = {
  CardType.undefinedCard: 'undefinedCard',
  CardType.masterCard: 'masterCard',
  CardType.visa: 'visa',
};
