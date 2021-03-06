
import 'package:card_wallet_app/blocs/card_action_bloc/card_action_bloc.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/small_mastercard_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/small_visa_card_widget.dart';
import 'package:card_wallet_app/model/user_model.dart';
import 'package:card_wallet_app/pages/add_card_page/add_card_page.dart';
import 'package:card_wallet_app/services/current_user_provider.dart';
import 'package:card_wallet_app/utils/card_enum.dart';

import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/main_colors.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardActionBloc, CardActionState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: MainColors.backgroundLightGradient,
              automaticallyImplyLeading: false,
              title: const Text('Cards', style: MainTextStyles.largeText),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const AddCardPage())),
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
                  CardModel cardModel = CurrentUserProvider
                      .currentUser.cardModelList[index];
                  return (cardModel.cardType == CardType.visa
                      ? SmallVisaCardWidget(cardModel: cardModel)
                      : SmallMasterCardWidget(cardModel: cardModel));
                },
                childCount:
                    CurrentUserProvider.currentUser.cardModelList.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
