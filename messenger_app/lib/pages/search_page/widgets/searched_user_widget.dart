import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/services/firebase_methods.dart';
import 'package:messenger_app/services/shared_preferences_methods.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class SearchedUser extends StatelessWidget {
  final int index;
  final String name;
  final String email;

  const SearchedUser(
      {required this.index, required this.name, required this.email, Key? key})
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
                maxRadius: 30,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: MainTextStyles.smallInputBlockStyle),
                  Text(email, style: MainTextStyles.smallInputBlockStyle),
                ],
              )),
              GestureDetector(
                onTap: () async {
                  String? myName = await SharedPreferencesMethods
                      .getUserNameSharedPreferences();
                  if (myName == null) {
                    throw Exception();
                  } else {
                    String chatRoomId =
                        FirebaseMethods.createChatRoomId(name, myName);
                    FirebaseMethods.createChatRoom(userName: name);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatDetailsPage(
                                userName: name,
                                email: email,
                                chatRoomId: chatRoomId)));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
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
