import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/models/user_chat_model.dart';
import 'package:messenger_app/pages/chat_detail_page/bloc/chat_detail_cubit.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class UserChatWidget extends StatelessWidget {
  final UserChatModel userChatModel;
  final int index;

  const UserChatWidget(
      {required this.userChatModel, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailsPage(
              chatRoomModel: userChatModel.chatRoom,
            ),
          ),
        );
        context
            .read<ChatDetailCubit>()
            .downLoadChatHistory(chatRoomId: userChatModel.chatRoom.chatRoomId);
      },
      child: Container(
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
                        backgroundImage: AssetImage(
                            userChatModel.chatRoom.anotherUserImageUrl),
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
                                userChatModel.chatRoom.anotherUserName,
                                style: MainTextStyles.smallInputBlockStyle
                                    .copyWith(
                                  color: MainColors.lightBlue,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                //todo stick of  death
                                userChatModel.lastMessage!.messageContent,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MainTextStyles.smallInputBlockStyle
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  userChatModel.lastMessage!.messageTime,
                  style: MainTextStyles.smallInputBlockStyle
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                )
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
      ),
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
