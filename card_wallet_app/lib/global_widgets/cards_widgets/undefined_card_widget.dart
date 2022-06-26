import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class UndefinedCardWidget extends StatelessWidget {
  final CardModel cardModel;

  const UndefinedCardWidget({required this.cardModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        color: Color(cardModel.colorValue),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Undefined Card', style: MainTextStyles.largeText),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _getCardNumber(cardModel.cardNumber),
                    textAlign: TextAlign.center,
                    style: MainTextStyles.cardNumber,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Balance',
                  style: MainTextStyles.cardInscription,
                ),
                const Spacer(),
                Text(
                  '\$ ${cardModel.balance}',
                  style: MainTextStyles.cardInscription
                      .copyWith(color: MainColors.commonWhite),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  cardModel.cardOwner,
                  style: MainTextStyles.cardInscription,
                ),
                const Spacer(),
                Text(
                  cardModel.validity,
                  style: MainTextStyles.cardInscription,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getCardNumber(String cardNumber) {
    String result = '';
    for (int i = 0; i < cardNumber.length; i++) {
      if (i != 0 && i % 4 == 0) {
        result = '$result   ${cardNumber[i]}';
      } else {
        result = '$result${cardNumber[i]}';
      }
    }
    return result;
  }
}
