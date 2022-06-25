// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']) ??
          CardType.undefinedCard,
      cardNumber: json['cardNumber'] as String? ?? '0000000000000000',
      colorValue: json['colorValue'] as int? ?? 4289045928,
      balance: json['balance'] as int? ?? 0,
      cardOwner: json['cardOwner'] as String? ?? 'Default Name',
      validity: json['validity'] as String? ?? '00/00',
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'cardType': _$CardTypeEnumMap[instance.cardType],
      'colorValue': instance.colorValue,
      'balance': instance.balance,
      'cardOwner': instance.cardOwner,
      'validity': instance.validity,
      'cardNumber': instance.cardNumber,
    };

const _$CardTypeEnumMap = {
  CardType.undefinedCard: 'undefinedCard',
  CardType.masterCard: 'masterCard',
  CardType.visa: 'visa',
};
