import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/chat_detail_page/bloc/chat_detail_cubit.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../utils/main_colors.dart';

class InputTextFieldWidget extends StatelessWidget {
  final String chatRoomId;
  final TextEditingController messageController;

  const InputTextFieldWidget({
    required this.messageController,
    required this.chatRoomId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
        height: 60.0,
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
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: MainColors.deepBlue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Icon(
                  Icons.add,
                  color: MainColors.creamWhite,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                    hintText: "Write a message...",
                    hintStyle: MainTextStyles.smallInputBlockStyle,
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<ChatDetailCubit>().createAndAddMessage(
                      message: messageController.text,
                      chatRoomId: chatRoomId,
                    );
                messageController.text = '';
              },
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
