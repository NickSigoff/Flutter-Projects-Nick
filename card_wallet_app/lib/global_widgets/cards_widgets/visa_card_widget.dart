import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class VisaCardWidget extends StatelessWidget {
  final CardModel cardModel;

  const VisaCardWidget({required this.cardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        color: Color(cardModel.colorValue),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Stack(
        children: [
          _buildBackgroundCard(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/visa_logo.png'),
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
        ],
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
      ..moveTo(0, size.height * 0.7)
      ..lineTo(0, size.height - 18)
      ..quadraticBezierTo(0, size.height, 18, size.height)
      ..lineTo(size.width - 18, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - 18)
      ..lineTo(size.width, size.height * 0.7);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
