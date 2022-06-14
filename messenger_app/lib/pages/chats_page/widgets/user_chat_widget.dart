import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/chat_detail_page/bloc/chat_detail_cubit.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/pages/chats_page/bloc/last_message_cubit.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../../models/chat_room_model.dart';

class UserChatWidget extends StatelessWidget {
  final ChatRoomModel chatRoomModel;
  final int index;

  const UserChatWidget(
      {required this.chatRoomModel, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<LastMessageCubit>()
        .downloadLastMessage(chatRoomModel.chatRoomId);
    return BlocBuilder<LastMessageCubit, LastMessageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailsPage(
                  chatRoomModel: chatRoomModel,
                ),
              ),
            );
            context
                .read<ChatDetailCubit>()
                .downLoadChatHistory(chatRoomId: chatRoomModel.chatRoomId);
          },
          child: _buildWidgetBody(state, chatRoomModel.chatRoomId),
        );
      },
    );
  }

  Widget _buildWidgetBody(LastMessageState state, String chatRoomId) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          _buildFirstDivider(index),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(chatRoomModel.anotherUserImageUrl),
                      maxRadius: 30,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chatRoomModel.anotherUserName,
                              style:
                                  MainTextStyles.smallInputBlockStyle.copyWith(
                                color: MainColors.lightBlue,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _buildMessageContent(state, chatRoomId)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildLastMessageTime(state, chatRoomId)
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: MainColors.lightGrey,
          ),
        ],
      ),
    );
  }

  Text _buildLastMessageTime(LastMessageState state, String chatRoomId) {
    return Text(
      state is LastMessageLoaded
          ? state.lastMessagesList
          .where((element) => element.id == chatRoomId)
          .isNotEmpty
          ? state.lastMessagesList
          .where((element) => element.id == chatRoomId)
          .first
          .get('messageTime')
          : ''
          : '',
      style: MainTextStyles.smallInputBlockStyle
          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }

  Text _buildMessageContent(LastMessageState state, String chatRoomId) {
    return Text(
      state is LastMessageLoaded
          ? state.lastMessagesList
          .where((element) => element.id == chatRoomId)
          .isNotEmpty
          ? state.lastMessagesList
          .where((element) => element.id == chatRoomId)
          .first
          .get('messageContent')
          : ''
          : '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: MainTextStyles.smallInputBlockStyle
          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildFirstDivider(int index) {
    if (index == 0) {
      return Column(
        children: const [
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: MainColors.lightGrey,
          ),
          SizedBox(
            height: 16.0,
          )
        ],
      );
    }
    return Container();
  }
}
