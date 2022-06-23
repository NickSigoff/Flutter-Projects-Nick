import 'package:card_wallet_app/global_widgets/cards_widgets/mastercard_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/undefined_card_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/visa_card_widget.dart';
import 'package:card_wallet_app/model/card_model.dart';
import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_gradients.dart';
import 'bloc/card_pattern_bloc.dart';

class AddCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardPatternBloc, CardPatternState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MainColors.backgroundLightGradient,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: MainColors.commonWhite,
              ),
            ),
          ),
          body: Container(
            decoration: MainGradients.backgroundMainPageGradient,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildPatternCard(state is CardPatternInitial
                    ? state.cardModel
                    : CardModel()),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width - 32.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: MainColors.lightGrey),
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(50),
                        Colors.white.withAlpha(15),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPatternCard(CardModel cardModel) {
    CardType cardType = cardModel.cardType;

    switch (cardType) {
      case CardType.masterCard:
        return MasterCardWidget(cardModel: cardModel);
      case CardType.visa:
        return VisaCardWidget(cardModel: cardModel);
      default:
        return UndefinedCardWidget(cardModel: cardModel);
    }
  }
}
