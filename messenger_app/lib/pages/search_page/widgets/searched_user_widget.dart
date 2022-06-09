import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/services/current_user_data.dart';
import 'package:messenger_app/services/firebase_service.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class SearchedUser extends StatelessWidget {
  final int index;
  final String searchedUserName;
  final String searchedUserEmail;
  final String searchedUserId;

  const SearchedUser(
      {required this.index,
      required this.searchedUserName,
      required this.searchedUserEmail,
      required this.searchedUserId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          _buildFirstDivider(index),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatars/10.jpg'),
                maxRadius: 30.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(searchedUserName,
                      style: MainTextStyles.smallInputBlockStyle),
                  Text(searchedUserEmail,
                      style: MainTextStyles.smallInputBlockStyle),
                ],
              )),
              GestureDetector(
                //todo checking twin chats
                onTap: () {
                  String chatRoomId =
                      FirebaseService().createChatRoomAddToUsersList(
                    searchedUserId: searchedUserId,
                    currentUserId: CurrentUserData.currentUserId,
                  );

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatDetailsPage(
                              userName: searchedUserName,
                              email: searchedUserEmail,
                              chatRoomId: chatRoomId)));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: MainColors.deepBlue,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Text(
                    'Message',
                    style: MainTextStyles.smallInputBlockStyle
                        .copyWith(color: MainColors.creamWhite),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
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
            height: 8.0,
          )
        ],
      );
    }
    return Container();
  }
}
