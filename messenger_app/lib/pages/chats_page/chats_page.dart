import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chats_page/widgets/user_chat_widget.dart';
import 'package:messenger_app/services/firebase_methods.dart';

import '../../services/shared_preferences_methods.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  Stream<DocumentSnapshot>? userDataStream;
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences().then((_) => {
          userDataStream = FirebaseMethods.getUserDataStream(_currentUserId!),
          setState(() {})
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Object?>>(
        stream: userDataStream,
        builder: (BuildContext context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.get('chatRoomList').length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    String chatRoomId =
                        snapshot.data?.get('chatRoomList')[index];
                    String anotherUserId = 'Undefined name';

                    anotherUserId =
                        _getAnotherUser(chatRoomId, _currentUserId!);
                    DocumentReference<Map<String, dynamic>> us =
                        FirebaseMethods.getUserById(anotherUserId);

                    return UserChatWidget(
                      name: 'name',
                      messageText: 'Some message text',
                      imageUrl: 'assets/images/avatars/11.jpg',
                      time: '00.00',
                      index: index,
                      chatRoomId: chatRoomId,
                    );
                  },
                )
              : Container();
        });
  }

  Future<void> _getDataFromSharedPreferences() async {
    _currentUserId =
        await SharedPreferencesMethods.getUserIdSharedPreferences();
  }

  String _getAnotherUser(String chatRoomId, String currentUserId) {
    List<String> users = chatRoomId.split('_');
    return users[0].compareTo(currentUserId) == 0 ? users[1] : users[0];
  }
}
