import 'package:card_wallet_app/global_widgets/cards_widgets/mastercard_widget.dart';
import 'package:card_wallet_app/model/card_model.dart';
import 'package:card_wallet_app/utils/main_gradients.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final CardModel cardModel;

  const DetailCard({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: MainGradients.backgroundMainPageGradient,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            MasterCardWidget(cardModel: cardModel),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWidget(CardModel cardModel) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        color: cardModel.color,
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }
}
