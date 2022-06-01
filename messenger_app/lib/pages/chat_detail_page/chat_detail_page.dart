import 'package:flutter/material.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/pages/chat_detail_page/widgets/input_text_field_widget.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class ChatDetailsPage extends StatelessWidget {
  final String userName;
  final String email;

  const ChatDetailsPage({required this.userName, required this.email, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChatMessage> messages = [];
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemBuilder: (context, index) {
                  return messages[index].messageSender == "receiver"
                      ? _buildLeftDialog(messages[index].messageContent)
                      : _buildRightDialog(messages[index].messageContent);
                },
              ),
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
          padding: const EdgeInsets.only(right: 16.0),
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
                    Text(userName,
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(fontWeight: FontWeight.w500)),
                    Text(email,
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(fontWeight: FontWeight.w500)),
                    Text("Online",
                        style: MainTextStyles.smallInputBlockStyle.copyWith(
                            color: MainColors.lightBlue, fontSize: 8)),
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

//final List<ChatMessage> messages = [
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'receiver',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'sender',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'receiver',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'sender',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'receiver',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'sender',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World',
//     messageType: 'receiver',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, Worldnjdfhdfj gryigiqrhg giqerjgjrjg beqyrgy rgr',
//     messageType: 'sender',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World jshfgj gy wegyfweq fwue fefkrwegwryfyrewgb ',
//     messageType: 'receiver',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, Worldtttttt ttttt ttttttttttt tttttttt ttt tttt tt tttttttt',
//     messageType: 'sender',
//   ),
//   ChatMessage(
//     messageContent: 'Hello, World.Hello, World.Hello, World.Hello, World.Hello, Worldmmghhhhhuuuuuuuuuuuuuuuhhhhh',
//     messageType: 'receiver',
//   ),
//   ChatMessage(
//     messageContent: 'End, World',
//     messageType: 'sender',
//   ),
// ];
