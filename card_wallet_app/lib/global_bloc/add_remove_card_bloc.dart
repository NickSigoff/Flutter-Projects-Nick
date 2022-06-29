import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/user_model.dart';
import '../services/current_user_provider.dart';
import '../services/shared_preferences_service.dart';

part 'add_remove_card_event.dart';

part 'add_remove_card_state.dart';

class AddRemoveCardBloc extends Bloc<AddRemoveCardEvent, AddRemoveCardState> {
  AddRemoveCardBloc() : super(AddRemoveCardInitial()) {
    on<AddCardToList>((event, emit) async {
      try {
        print(' bloc ${event.cardModel.cssNumber}');
        List<CardModel> cardList = [];
        cardList.addAll(CurrentUserProvider.currentUser.cardModelList);
        cardList.add(event.cardModel);
        CurrentUserProvider.currentUser.cardModelList = cardList;
        await SharedPreferencesService().setCurrentUserSharedPreferences(
            jsonEncode(CurrentUserProvider.currentUser.toJson()));
        emit(AddRemoveCardSuccess());
      } catch (e) {
        emit(AddRemoveCardError());
      }
    });

    on<RemoveCardFromList>((event, emit) async {
      try {
        CurrentUserProvider.currentUser.cardModelList.remove(event.cardModel);
        await SharedPreferencesService().setCurrentUserSharedPreferences(
            jsonEncode(CurrentUserProvider.currentUser.toJson()));
        emit(AddRemoveCardSuccess());
      } catch (e) {
        print(e);
        emit(AddRemoveCardError());
      }
    });
  }
}
