import 'package:card_wallet_app/utils/main_colors.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';

import '../../model/card_model.dart';
import '../../pages/detail_card/card_detaily.dart';

class SmallMasterCardWidget extends StatelessWidget {
  final CardModel cardModel;

  const SmallMasterCardWidget({required this.cardModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 40) / 2;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailCard(cardModel: cardModel)));
      },
      child: Container(
        width: width,
        height: width * 2 / 3,
        decoration: BoxDecoration(
          color: Color(cardModel.colorValue),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            _buildBackgroundCard(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('MasterCard',
                          style:
                              MainTextStyles.largeText.copyWith(fontSize: 15)),
                      const Spacer(),
                      Image.asset(
                        'assets/images/mastercard_logo.png',
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _getCardNumber(cardModel.cardNumber),
                          textAlign: TextAlign.center,
                          style:
                              MainTextStyles.cardNumber.copyWith(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Balance',
                        style: MainTextStyles.smallCardInscription,
                      ),
                      const Spacer(),
                      Text(
                        '\$ ${cardModel.balance}',
                        style: MainTextStyles.cardInscription
                            .copyWith(color: MainColors.commonWhite,fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        cardModel.cardOwner,
                        style: MainTextStyles.cardInscription
                            .copyWith(fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        cardModel.validity,
                        style: MainTextStyles.smallCardInscription,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCard() {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
        color: Colors.white.withOpacity(0.4),
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

class BackgroundClipper extends CustomClipper<Path> {
  BackgroundClipper();

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width * 0.65, size.height)
      ..conicTo(size.width * 0.55, size.height * 0.3, size.width,
          size.height * 0.5, 0.6)
      ..lineTo(size.width, size.height - 18)
      ..quadraticBezierTo(
          size.width, size.height, size.width - 18, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
