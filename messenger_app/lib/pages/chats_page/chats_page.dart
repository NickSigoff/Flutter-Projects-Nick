import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/chat_cubit.dart';
import 'package:messenger_app/pages/chats_page/widgets/user_chat_widget.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ChatCubit>().downloadChats(); // todo where is better?
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return _buildChatsLoading(context);
        } else if (state is ChatEmptyChats) {
          return _buildEmptyChats();
        } else if (state is ChatDownloadedChats) {
          return ListView.builder(
            itemCount: state.chatRoomModelList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return UserChatWidget(
                chatRoomModel: state.chatRoomModelList[index],
                index: index,
              );
            },
          );
        } else {
          return _buildChatsLoading(context);
        }
      },
    );
  }

  SizedBox _buildChatsLoading(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: const [
          Spacer(),
          Center(child: CircularProgressIndicator()),
          Text(
            'Chats are loading',
            style: MainTextStyles.smallInputBlockStyle,
          ),
          Spacer(),
        ],
      ),
    );
  }

  Column _buildEmptyChats() {
    return Column(
      children: [
        Container(
            height: 150.0,
            width: 150.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/empty_chats.png')))),
        const Text(
          'Your chat list is empty',
          style: MainTextStyles.largeInputBlockStyle,
        ),
      ],
    );
  }
}
