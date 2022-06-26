import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:card_wallet_app/services/current_user_provider.dart';
import 'package:card_wallet_app/services/shared_preferences_service.dart';
import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:meta/meta.dart';

import '../../../model/user_model.dart';

part 'card_pattern_event.dart';

part 'card_pattern_state.dart';

class CardPatternBloc extends Bloc<CardPatternEvent, CardPatternState> {
  CardPatternBloc() : super(CardPatternState(cardModel: const CardModel())) {
    on<ChangeColorEvent>((event, emit) => emit(CardPatternState(
        cardModel:
            state.cardModel.copyWith(colorValue: event.cardColor.value))));

    on<ChangeCardNumberEvent>((event, emit) => emit(CardPatternState(
        cardModel: state.cardModel.copyWith(cardNumber: event.cardNumber))));

    on<ChangeNameEvent>((event, emit) => emit(CardPatternState(
        cardModel: state.cardModel.copyWith(cardOwner: event.ownerCardName))));

    on<ChangeValidityDateEvent>((event, emit) => emit(CardPatternState(
        cardModel: state.cardModel.copyWith(validity: event.validity))));

    on<ChangeCardTypeEvent>((event, emit) => emit(CardPatternState(
        cardModel: state.cardModel.copyWith(cardType: event.cardType))));

    on<AddCardToListEvent>((event, emit) async {
      List<dynamic> cardList = [];
      cardList.addAll(CurrentUserProvider.currentUser.cardModelList);
      cardList.add(event.card);
      CurrentUserProvider.currentUser.cardModelList = cardList;
      await SharedPreferencesService().setCurrentUserSharedPreferences(
          jsonEncode(CurrentUserProvider.currentUser.toJson()));
      emit(CardPatternState(cardModel: state.cardModel));
    });
  }
}
