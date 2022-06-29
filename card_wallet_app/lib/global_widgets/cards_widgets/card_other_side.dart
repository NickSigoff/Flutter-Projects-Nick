import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/main_colors.dart';

class CardOtherSide extends StatelessWidget {
  final CardModel cardModel;

  const CardOtherSide({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        color: Color(cardModel.colorValue),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            color: MainColors.commonBlack,
            height: 60.0,
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 40.0,
            width: 100.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: MainColors.commonWhite,
            child: Row(
              children: [
                const Text(
                  'CSS',
                  style: MainTextStyles.regularGreyText,
                ),
                const Spacer(),
                Text(
                  cardModel.cssNumber,
                  style: MainTextStyles.regularGreyText,
                )
              ],
            ),
          ),
          const Text(
            'Don\'t show anybody this code',
            style: MainTextStyles.errorText,
          )
        ],
      ),
    );
  }
}
