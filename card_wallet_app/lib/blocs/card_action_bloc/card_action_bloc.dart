import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_model.dart';
import '../../services/current_user_provider.dart';
import '../../services/shared_preferences_service.dart';

part 'card_action_event.dart';
part 'card_action_state.dart';

class CardActionBloc extends Bloc<CardActionEvent, CardActionState> {
  CardActionBloc() : super(CardActionInitial()) {
    on<AddCardEvent>((event, emit) async {
      try {
        List<CardModel> cardList = [];
        cardList.addAll(CurrentUserProvider.currentUser.cardModelList);
        cardList.add(event.cardModel);
        CurrentUserProvider.currentUser.cardModelList = cardList;
        await SharedPreferencesService().setCurrentUserSharedPreferences(
            jsonEncode(CurrentUserProvider.currentUser.toJson()));
        emit(CardAddSuccess());
      } catch (e) {
        emit(CardAddError());
      }
    });

    on<RemoveCardEvent>((event, emit) async {
      try {
        CurrentUserProvider.currentUser.cardModelList.remove(event.cardModel);
        await SharedPreferencesService().setCurrentUserSharedPreferences(
            jsonEncode(CurrentUserProvider.currentUser.toJson()));
        emit(CardRemoveSuccess());
      } catch (e) {
        emit(CardRemoveError());
      }
    });
  }
}
