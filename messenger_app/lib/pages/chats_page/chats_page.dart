import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/models/chat_users_model.dart';
import 'package:messenger_app/pages/chats_page/widgets/user_chat_widget.dart';
import 'package:messenger_app/services/firebase_methods.dart';

import '../../services/shared_preferences_methods.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  Stream<DocumentSnapshot>? userData;
  String? _currentUserId;
  List<ChatUsers> chatUsers = [];

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
    userData = FirebaseMethods.getUserDataStream(
        _currentUserId ?? '4OpOhoBfCVNCqi8qzRiHheXne643');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Object?>>(
        stream: userData,
        builder: (BuildContext context, snapshot) {
          List<dynamic> chatRoomList =
              snapshot.hasData ? snapshot.data?.get('chatRoomList') : [];
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: chatRoomList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // String chatRoomId = chatRoomList[index];
                    // CollectionReference<Map<String, dynamic>> messages =
                    //     FirebaseMethods.getMessagesFromChatRoom(
                    //         chatRoomId: chatRoomId);
                    // messages.
                    return UserChatWidget(
                      name: '$index',
                      messageText: 'chatUsers[index].messageText',
                      imageUrl: 'assets/images/avatars/11.jpg',
                      time: '00.00',
                      index: index,
                    );
                  },
                )
              : Container();
        });
  }

  Future<void> _getDataFromSharedPreferences() async {
    _currentUserId =
        await SharedPreferencesMethods.getUserIdSharedPreferences();
    setState(() {});
  }
}
