import 'package:card_wallet_app/utils/main_gradients.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global_bloc/add_remove_card_bloc.dart';
import '../../global_widgets/flip_card_widget.dart';
import '../../model/user_model.dart';
import '../../utils/main_colors.dart';

class DetailCard extends StatelessWidget {
  final CardModel cardModel;

  const DetailCard({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRemoveCardBloc, AddRemoveCardState>(
      listener: (context, state) {
        if (state is AddRemoveCardError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Error by removing',
              style: MainTextStyles.cardNumber,
            ),
            backgroundColor: Colors.red,
          ));
        }
        if (state is AddRemoveCardSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'The Card has been deleted',
              style: MainTextStyles.cardNumber,
            ),
            backgroundColor: Colors.green,
          ));
        }
      },
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
            actions: [
              IconButton(
                  onPressed: () {
                    context
                        .read<AddRemoveCardBloc>()
                        .add(RemoveCardFromList(cardModel: cardModel));
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete),
                  color: MainColors.commonWhite)
            ],
          ),
          body: Container(
            decoration: MainGradients.backgroundMainPageGradient,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                FlipCardWidget(cardModel: cardModel),
              ],
            ),
          ),
        );
      },
    );
  }
}
