import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/chats_page/block/chats_cubit.dart';
import 'package:messenger_app/pages/chats_page/widgets/user_chat_widget.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/firebase_methods.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  //todo bloc??
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Object?>>(
        stream:
            FirebaseMethods.getUserDataStream(CurrentUserData.currentUserId),
        builder: (BuildContext context, snapshot) {
          return snapshot.hasData
              ? snapshot.data?.get('chatRoomList').length != 0
                  ? ListView.builder(
                      itemCount: snapshot.data?.get('chatRoomList').length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String chatRoomId =
                            snapshot.data?.get('chatRoomList')[index];
                        String searchedUserId = context
                            .read<ChatsCubit>()
                            .getAnotherUser(
                                currentUserId: CurrentUserData.currentUserId,
                                chatRoomId: chatRoomId);
                        return FutureBuilder(
                          future: FirebaseMethods.getUserById(searchedUserId),
                          builder: (BuildContext context,
                              AsyncSnapshot<
                                      DocumentSnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            return UserChatWidget(
                              searchedUserName: snapshot.hasData
                                  ? snapshot.data!.get('name')
                                  : null,
                              searchedUserEmail: snapshot.hasData
                                  ? snapshot.data!.get('email')
                                  : null,
                              imageUrl: 'assets/images/avatars/11.jpg',
                              index: index,
                              chatRoomId: chatRoomId,
                            );
                          },
                        );
                      },
                    )
                  : Column(
                      children: [
                        Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/empty_chats.png')))),
                        const Text(
                          'Your chat list is empty',
                          style: MainTextStyles.largeInputBlockStyle,
                        ),
                      ],
                    )
              : const Center(child: Text('Error'));
        });
  }
}
