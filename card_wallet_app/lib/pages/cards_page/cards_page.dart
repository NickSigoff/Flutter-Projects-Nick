import 'package:card_wallet_app/global_bloc/add_remove_card_bloc.dart';
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
    return BlocBuilder<AddRemoveCardBloc, AddRemoveCardState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: MainColors.backgroundLightGradient,
              automaticallyImplyLeading: false,
              title: const Text('Cards', style: MainTextStyles.largeText),
              actions: [
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(
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
                  return (CurrentUserProvider.currentUser.cardModelList[index]
                  as CardModel)
                      .cardType ==
                      CardType.visa
                      ? SmallVisaCardWidget(
                      cardModel: CurrentUserProvider
                          .currentUser.cardModelList[index] as CardModel)
                      : SmallMasterCardWidget(
                      cardModel: CurrentUserProvider
                          .currentUser.cardModelList[index] as CardModel);
                },
                childCount: CurrentUserProvider.currentUser.cardModelList
                    .length,
              ),
            ),
          ],
        );
      },
    );
  }
}
