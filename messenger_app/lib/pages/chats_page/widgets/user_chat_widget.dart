import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/models/chat_room_model.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/pages/chats_page/bloc/current_message/current_message_cubit.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class UserChatWidget extends StatelessWidget {
  final ChatRoomModel chatRoomModel;
  final int index;

  const UserChatWidget(
      {required this.chatRoomModel, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context // todo where is better?
        .read<CurrentMessageCubit>()
        .downloadCurrentChat(chatRoomModel.chatRoomId);
    return BlocBuilder<CurrentMessageCubit, CurrentMessageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatDetailsPage(
                        userName: chatRoomModel.anotherUserName,
                        email: chatRoomModel.anotherUserEmail,
                        chatRoomId: chatRoomModel.chatRoomId)));
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                            maxRadius: 30.0,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chatRoomModel.anotherUserName,
                                    style: MainTextStyles.smallInputBlockStyle
                                        .copyWith(
                                      color: MainColors.lightBlue,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  state is CurrentMessageLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : Text(
                                          state is CurrentMessageLoaded
                                              ? state.messageContent
                                              : 'Chat is empty',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: MainTextStyles
                                              .smallInputBlockStyle
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
                      state is CurrentMessageLoaded ? state.messageTime : '',
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
      },
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

// class UserChatWidget extends StatelessWidget {
//   final String chatRoomId;
//   final String? searchedUserName;
//   final String imageUrl;
//   final String? searchedUserEmail;
//   final int index;
//
//   const UserChatWidget(
//       {required this.searchedUserEmail,
//         required this.imageUrl,
//         required this.chatRoomId,
//         required this.searchedUserName,
//         required this.index,
//         Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot<Object?>>(
//         stream: FirebaseService().getChatsStream(chatRoomId),
//         builder: (BuildContext context, snapshot) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ChatDetailsPage(
//                           userName: searchedUserName,
//                           email: searchedUserEmail,
//                           chatRoomId: chatRoomId)));
//             },
//             child: Container(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Column(
//                 children: [
//                   _buildFirstDivider(index),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: AssetImage(imageUrl),
//                               maxRadius: 30,
//                             ),
//                             const SizedBox(
//                               width: 16,
//                             ),
//                             Expanded(
//                               child: Container(
//                                 color: Colors.transparent,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     searchedUserName == null
//                                         ? const CircularProgressIndicator()
//                                         : Text(
//                                       searchedUserName!,
//                                       style: MainTextStyles
//                                           .smallInputBlockStyle
//                                           .copyWith(
//                                         color: MainColors.lightBlue,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//                                     Text(
//                                       snapshot.hasData
//                                           ? snapshot.data!.docs.isEmpty
//                                           ? 'Chat is empty'
//                                           : snapshot.data!.docs.last
//                                           .get('messageContent')
//                                           : 'Some message text',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: MainTextStyles.smallInputBlockStyle
//                                           .copyWith(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         snapshot.hasData
//                             ? snapshot.data!.docs.isEmpty
//                             ? ''
//                             : snapshot.data!.docs.last.get('messageTime')
//                             : '00:00',
//                         style: MainTextStyles.smallInputBlockStyle.copyWith(
//                             fontSize: 12, fontWeight: FontWeight.w400),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 16.0,
//                   ),
//                   const Divider(
//                     height: 1.0,
//                     thickness: 1.0,
//                     color: MainColors.lightGrey,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   Widget _buildFirstDivider(int index) {
//     if (index == 0) {
//       return Column(
//         children: const [
//           Divider(
//             height: 1.0,
//             thickness: 1.0,
//             color: MainColors.lightGrey,
//           ),
//           SizedBox(
//             height: 16.0,
//           )
//         ],
//       );
//     }
//     return Container();
//   }
// }
//
