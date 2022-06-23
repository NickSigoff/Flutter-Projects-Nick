import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/card_model.dart';

part 'card_pattern_event.dart';
part 'card_pattern_state.dart';

class CardPatternBloc extends Bloc<CardPatternEvent, CardPatternState> {
  CardPatternBloc() : super(CardPatternInitial(cardModel: CardModel())) {
    on<CardPatternEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
