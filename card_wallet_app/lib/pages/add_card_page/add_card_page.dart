import 'package:card_wallet_app/global_widgets/cards_widgets/mastercard_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/undefined_card_widget.dart';
import 'package:card_wallet_app/global_widgets/cards_widgets/visa_card_widget.dart';
import 'package:card_wallet_app/model/card_model.dart';
import 'package:card_wallet_app/utils/card_enum.dart';
import 'package:card_wallet_app/utils/main_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_gradients.dart';
import 'bloc/card_pattern_bloc.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _validityController = TextEditingController();

  final items = const [
    'MasterCard',
    'Visa',
  ];

  @override
  void initState() {
    super.initState();
    // _cardNumberController.addListener(() {context.read<C>() })
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardPatternBloc, CardPatternState>(
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
                  onPressed: () {}, icon: const Icon(Icons.add_circle_outline))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: MainGradients.backgroundMainPageGradient,
              padding:
                  const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              child: Column(
                children: [
                  _buildPatternCard(state.cardModel),
                  const SizedBox(height: 16.0),
                  _buildInputForm(context, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildInputForm(BuildContext context, CardPatternState state) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width - 32.0,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: MainColors.lightGrey),
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [
            Colors.white.withAlpha(50),
            Colors.white.withAlpha(15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: Color(state.cardModel.colorValue), //default color
                          onColorChanged: (Color color) {
                            context
                                .read<CardPatternBloc>()
                                .add(ChangeColorEvent(cardColor: color));
                          },
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('DONE'),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); //dismiss the color picker
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(state.cardModel.colorValue)),
            ),
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField(
            style: MainTextStyles.profileTextStyle
                .copyWith(color: MainColors.commonWhite),
            items: items.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            decoration: _buildInputDecoration(
                hint: 'Choose the card type', icon: Icons.credit_card),
            onChanged: (data) {
              context.read<CardPatternBloc>().add(ChangeCardTypeEvent(
                  cardType:
                      data == 'Visa' ? CardType.visa : CardType.masterCard));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextField(
              style: MainTextStyles.profileTextStyle
                  .copyWith(color: MainColors.commonWhite),
              onChanged: (string) => context.read<CardPatternBloc>().add(
                  ChangeCardNumberEvent(
                      cardNumber: _cardNumberController.text.trim())),
              controller: _cardNumberController,
              decoration: _buildInputDecoration(
                  hint: 'Enter the card number', icon: Icons.numbers),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextField(
              style: MainTextStyles.profileTextStyle
                  .copyWith(color: MainColors.commonWhite),
              onChanged: (string) => context.read<CardPatternBloc>().add(
                  ChangeNameEvent(ownerCardName: _nameController.text.trim())),
              controller: _nameController,
              decoration: _buildInputDecoration(
                  hint: 'Enter your name', icon: Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextField(
              style: MainTextStyles.profileTextStyle
                  .copyWith(color: MainColors.commonWhite),
              onChanged: (string) => context.read<CardPatternBloc>().add(
                  ChangeValidityDateEvent(
                      validity: _validityController.text.trim())),
              controller: _validityController,
              decoration: _buildInputDecoration(
                  hint: 'Enter the card validity', icon: Icons.calendar_month),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MainColors.commonWhite, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MainColors.lightGrey, width: 2.0),
        ),
        hintText: hint,
        hintStyle: MainTextStyles.profileTextStyle
            .copyWith(color: MainColors.commonWhite),
        icon: Icon(icon, color: MainColors.commonWhite));
  }

  Widget _buildPatternCard(CardModel cardModel) {
    CardType cardType = cardModel.cardType;

    switch (cardType) {
      case CardType.masterCard:
        return MasterCardWidget(cardModel: cardModel);
      case CardType.visa:
        return VisaCardWidget(cardModel: cardModel);
      default:
        return UndefinedCardWidget(cardModel: cardModel);
    }
  }
}
