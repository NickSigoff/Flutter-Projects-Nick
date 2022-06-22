import 'package:card_wallet_app/model/card_model.dart';

import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_gradients.dart';
import '../detail_card/card_detaily.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);
  final List<Color> colors = const [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.blueGrey,
    Colors.brown,
    Colors.grey,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.blueAccent,
    Colors.indigo,
    Colors.deepOrange,
    Colors.greenAccent,
    Colors.deepPurple,
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
                  onPressed: () {}, icon: const Icon(Icons.add_circle_outline))
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
                return GestureDetector(
                  onTap: () {
                    //CardModel cardModel = CardModel(color: colors[index]);
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             DetailCard(cardModel: cardModel)));
                  },
                  child: Card(
                    color: colors[index],
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('$index'),
                    ),
                  ),
                );
              },
              childCount: colors.length,
            ),
          ),
        ],
      ),
    );
  }
}
