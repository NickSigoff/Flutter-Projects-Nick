import 'package:card_wallet_app/global_widgets/cards_widgets/mastercard_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/visa_card_widget.dart';
import 'package:card_wallet_app/model/card_model.dart';
import 'package:card_wallet_app/pages/cards_page/cards_page.dart';
import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:card_wallet_app/utils/main_gradients.dart';
import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';

class DetailCard extends StatelessWidget {
  final CardModel cardModel;

  const DetailCard({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            cardModel.cardType == CardType.visa
                ? VisaCardWidget(cardModel: cardModel)
                : MasterCardWidget(cardModel: cardModel),
          ],
        ),
      ),
    );
  }
}
