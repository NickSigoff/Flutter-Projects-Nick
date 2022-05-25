import 'package:flutter/material.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../utils/main_colors.dart';

class InputTextFieldWidget extends StatelessWidget {
  const InputTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: MainColors.creamWhite,
            border: Border.symmetric(
                horizontal: BorderSide(color: MainColors.lightGrey))),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: MainColors.deepBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add,
                  color: MainColors.creamWhite,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Write a message...",
                    hintStyle: MainTextStyles.smallInputBlockStyle,
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: MainColors.deepBlue,
              elevation: 0,
              child: const Icon(
                Icons.send,
                color: MainColors.creamWhite,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
