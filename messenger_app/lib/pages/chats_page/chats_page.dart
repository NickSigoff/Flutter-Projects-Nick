import 'package:flutter/material.dart';
import 'package:messenger_app/models/chat_users_model.dart';
import 'package:messenger_app/pages/chats_page/widgets/user_chat_widget.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: 'Jane Russel',
        messageText: 'Awesome Setup',
        imageUrl: 'assets/images/avatars/0.jpg',
        time: 'Now'),
    ChatUsers(name: 'Glady\'s Murphy',
        messageText: 'That\'s Great',
        imageUrl: 'assets/images/avatars/1.jpg',
        time: 'Yesterday'),
    ChatUsers(name: 'Jorge Henry',
        messageText: 'Hey where are you?',
        imageUrl: 'assets/images/avatars/2.jpg',
        time: '31 Mar'),
    ChatUsers(name: 'Philip Fox',
        messageText: 'Busy! Call me in 20 mins',
        imageUrl: 'assets/images/avatars/3.jpg',
        time: '28 Mar'),
    ChatUsers(name: 'Debra Hawkins',
        messageText: 'Thankyou, It\'s awesome',
        imageUrl: 'assets/images/avatars/4.jpg',
        time: '23 Mar'),
    ChatUsers(name: 'Jacob Pena',
        messageText: 'will update you in evening',
        imageUrl: 'assets/images/avatars/5.jpg',
        time: '17 Mar'),
    ChatUsers(name: 'Andrey Jones',
        messageText: 'Can you please share the file?',
        imageUrl: 'assets/images/avatars/6.jpg',
        time: '24 Feb'),
    ChatUsers(name: 'John Wick',
        messageText: 'How are you?',
        imageUrl: 'assets/images/avatars/7.jpg',
        time: '18 Feb'),
    ChatUsers(name: 'John Wick',
        messageText: 'How are you?',
        imageUrl: 'assets/images/avatars/8.jpg',
        time: '18 Feb'),
    ChatUsers(name: 'John Wick',
        messageText: 'How are you?',
        imageUrl: 'assets/images/avatars/9.jpg',
        time: '18 Feb'),
    ChatUsers(name: 'John Wick',
        messageText: 'How are you?',
        imageUrl: 'assets/images/avatars/10.jpg',
        time: '18 Feb')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatUsers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return UserChatWidget(
          name: chatUsers[index].name,
          messageText: chatUsers[index].messageText,
          imageUrl: chatUsers[index].imageUrl,
          time: chatUsers[index].time,
          index: index,
          isMessageRead: (index == 0 || index == 3) ? true : false,
        );
      },
    );
  }
}

