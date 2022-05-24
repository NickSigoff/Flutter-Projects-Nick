import 'package:flutter/material.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/pages/chat_detail_page/widgets/input_text_field_widget.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class ChatDetailsPage extends StatelessWidget {
  ChatDetailsPage({Key? key}) : super(key: key);

  final List<ChatMessage> messages = [
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'receiver',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'sender',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'receiver',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'sender',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'receiver',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'sender',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'receiver',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'sender',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'receiver',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'sender',
    ),
    ChatMessage(
      messageContent: 'Hello, World',
      messageType: 'receiver',
    ),
    ChatMessage(
      messageContent: 'End, World',
      messageType: 'sender',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemBuilder: (context, index) {
                return messages[index].messageType == "receiver"
                    ? _buildLeftDialog(messages[index].messageContent)
                    : _buildRightDialog(messages[index].messageContent);
              },
            ),
            const InputTextFieldWidget(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBarWidget(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MainColors.creamWhite,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatars/0.jpg'),
                maxRadius: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kriss Benwat",
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(fontWeight: FontWeight.w500)),
                    Text("Online",
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(color: MainColors.lightBlue)),
                  ],
                ),
              ),
              const Icon(Icons.call, color: MainColors.black),
              const SizedBox(width: 16.0),
              const Icon(Icons.videocam_rounded, color: MainColors.black),
              const SizedBox(width: 16.0),
              const Icon(Icons.more_vert, color: MainColors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftDialog(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: MainColors.lightGrey,
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            style: MainTextStyles.smallInputBlockStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildRightDialog(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            color: MainColors.deepBlue,
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            style: MainTextStyles.smallInputBlockStyle
                .copyWith(color: MainColors.creamWhite),
          ),
        ),
      ),
    );
  }
}
