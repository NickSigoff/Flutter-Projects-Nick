import 'package:card_wallet_app/global_widgets/cards_widgets/small_mastercard_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/small_visa_card_widget.dart';
import 'package:card_wallet_app/model/card_model.dart';
import 'package:card_wallet_app/pages/add_card_page/add_card_page.dart';
import 'package:card_wallet_app/utils/card_enum.dart';

import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_gradients.dart';

class CardsPage extends StatelessWidget {
  CardsPage({Key? key}) : super(key: key);
  final List<int> colors = [
    Colors.red.value,
    Colors.blue.value,
    Colors.orange.value,
    Colors.blueGrey.value,
    Colors.brown.value,
    Colors.grey.value,
    Colors.green.value,
    Colors.pink.value,
    Colors.purple.value,
    Colors.blueAccent.value,
    Colors.indigo.value,
    Colors.deepOrange.value,
    Colors.greenAccent.value,
    Colors.deepPurple.value,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MainGradients.backgroundMainPageGradient,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: MainColors.backgroundLightGradient,
            automaticallyImplyLeading: false,
            title: const Text('Cards', style: MainTextStyles.largeText),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddCardPage())),
                  icon: const Icon(Icons.add_circle_outline))
            ],
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 3 / 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                CardModel cardModel = CardModel(
                  cardNumber: '1234567891234567',
                  validity: '04/25',
                  colorValue: colors[index],
                  balance: 1000,
                  cardOwner: 'Frank Franklin',
                  cardType: index.isEven ? CardType.masterCard : CardType.visa,
                );
                return cardModel.cardType == CardType.visa
                    ? SmallVisaCardWidget(cardModel: cardModel)
                    : SmallMasterCardWidget(cardModel: cardModel);
              },
              childCount: colors.length,
            ),
          ),
        ],
      ),
    );
  }
}
