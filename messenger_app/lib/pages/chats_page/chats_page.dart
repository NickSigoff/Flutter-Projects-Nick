import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/chat_cubit.dart';
import 'package:messenger_app/pages/chats_page/widgets/user_chat_widget.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ChatCubit>().downloadChats();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatInitial) {
          return _buildChatsLoading(context);
        } else if (state is ChatDownloadedChats) {
          return StreamBuilder<DocumentSnapshot<Object?>>(
              stream: state.stream,
              builder: (BuildContext context, snapshot) {
                return snapshot.hasData
                    ? _buildListView(snapshot)
                    : Container();
              });
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

  Widget _buildListView(AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.get('chatRoomList').length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String chatRoomId = snapshot.data?.get('chatRoomList')[index];
        String searchedUserId = _getAnotherUser(
            currentUserId: CurrentUserData.currentUserId,
            chatRoomId: chatRoomId);
        return FutureBuilder(
          future: FirebaseService().getUserById(searchedUserId),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            return UserChatWidget(
              searchedUserName:
                  snapshot.hasData ? snapshot.data!.get('name') : null,
              searchedUserEmail:
                  snapshot.hasData ? snapshot.data!.get('email') : null,
              imageUrl: 'assets/images/avatars/11.jpg',
              index: index,
              chatRoomId: chatRoomId,
            );
          },
        );
      },
    );
  }

  String _getAnotherUser(
      {required String chatRoomId, required String currentUserId}) {
    List<String> users = chatRoomId.split('_');
    return users[0].compareTo(currentUserId) == 0 ? users[1] : users[0];
  }

  Column buildEmptyChats() {
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
