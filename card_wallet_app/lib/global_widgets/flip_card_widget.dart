import 'dart:math';

import 'package:card_wallet_app/global_widgets/cards_widgets/card_other_side.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/mastercard_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/visa_card_widget.dart';
import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class FlipCardWidget extends StatefulWidget {
  final CardModel cardModel;

  const FlipCardWidget({Key? key, required this.cardModel}) : super(key: key);

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  late bool _showFrontSide;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: _showFrontSide
            ? widget.cardModel.cardType == CardType.masterCard
                ? MasterCardWidget(cardModel: widget.cardModel)
                : VisaCardWidget(cardModel: widget.cardModel)
            : CardOtherSide(cardModel: widget.cardModel),
      ),
    );
  }

  Widget transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }
}
