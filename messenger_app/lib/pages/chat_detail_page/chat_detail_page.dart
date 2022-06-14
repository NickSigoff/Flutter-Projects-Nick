import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/models/chat_message_model.dart';
import 'package:messenger_app/pages/chat_detail_page/bloc/chat_detail_cubit.dart';
import 'package:messenger_app/pages/chat_detail_page/widgets/input_text_field_widget.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../models/chat_room_model.dart';
import '../../utils/main_colors.dart';

class ChatDetailsPage extends StatelessWidget {
  final ChatRoomModel chatRoomModel;
  final String? draft;

  late final TextEditingController messageController;

  ChatDetailsPage({this.draft, required this.chatRoomModel, Key? key})
      : super(key: key) {
    messageController = TextEditingController(text: draft);
  }

  @override
  Widget build(BuildContext context) {
    // context
    //     .read<ChatDetailCubit>()
    //     .downLoadChatHistory(chatRoomId: 'chatRoomId');
    return BlocBuilder<ChatDetailCubit, ChatDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBarWidget(context),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                _buildChatConversation(state),
                InputTextFieldWidget(
                    chatRoomId: chatRoomModel.chatRoomId,
                    messageController: messageController),
              ],
            ),
          ),
        );
      },
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
                onPressed: () async {
                  Navigator.of(context).maybePop(await context
                      .read<ChatDetailCubit>()
                      .saveMessageDraft(
                          value: messageController.text.trim(),
                          chatRoomId: chatRoomModel.chatRoomId));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatars/11.jpg'),
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
                    Text(chatRoomModel.anotherUserName,
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(fontWeight: FontWeight.w500)),
                    Text(chatRoomModel.anotherUserEmail,
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

  Widget _buildChatConversation(ChatDetailState state) {
    if (state is ChatDetailEmpty) {
      return const Text('Chat is empty');
    } else if (state is ChatDetailLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ChatDetailLoaded) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: ListView.builder(
          reverse: true,
          itemCount: state.messagesList.length,
          shrinkWrap: true,
          //todo
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemBuilder: (context, index) {
            int reverseIndex = state.messagesList.length - 1 - index;
            ChatMessage chatMessage = state.messagesList[reverseIndex];

            return chatMessage.messageSender == chatRoomModel.anotherUserName
                ? _buildLeftDialog(
                    message: chatMessage.messageContent,
                    time: chatMessage.messageTime)
                : _buildRightDialog(
                    message: chatMessage.messageContent,
                    time: chatMessage.messageTime);
          },
        ),
      );
    } else {
      return const Text('Error');
    }
  }

  Widget _buildLeftDialog({required String message, required String time}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            color: MainColors.lightGrey,
          ),
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: MainTextStyles.smallInputBlockStyle,
              ),
              Text(
                time,
                textAlign: TextAlign.start,
                style:
                    MainTextStyles.smallInputBlockStyle.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightDialog({required String message, required String time}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
            color: MainColors.deepBlue,
          ),
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: MainTextStyles.smallInputBlockStyle
                    .copyWith(color: MainColors.creamWhite),
              ),
              Text(
                time,
                textAlign: TextAlign.start,
                style: MainTextStyles.smallInputBlockStyle
                    .copyWith(fontSize: 10, color: MainColors.creamWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
