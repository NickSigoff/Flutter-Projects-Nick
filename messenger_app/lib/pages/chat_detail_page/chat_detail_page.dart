import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chat_detail_page/widgets/input_text_field_widget.dart';
import 'package:messenger_app/services/firebase_methods.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class ChatDetailsPage extends StatefulWidget {
  final String userName;
  final String email;
  final String chatRoomId;

  const ChatDetailsPage(
      {required this.userName,
      required this.email,
      required this.chatRoomId,
      Key? key})
      : super(key: key);

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  Stream<QuerySnapshot>? chats;

  @override
  void initState() {
    super.initState();
    chats = FirebaseMethods.getChatsStream(widget.chatRoomId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: StreamBuilder<QuerySnapshot<Object?>>(
                  stream: chats,
                  builder: (BuildContext context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data?.docs.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            itemBuilder: (context, index) {
                              int reverseIndex =
                                  snapshot.data!.docs.length - 1 - index;
                              //todo stick of death
                              var doc = snapshot.data!.docs[reverseIndex];
                              return doc.get('messageSender') == widget.userName
                                  ? _buildLeftDialog(
                                      message: doc.get('messageContent'),
                                      time: doc.get('messageTime'))
                                  : _buildRightDialog(
                                      message: doc.get('messageContent'),
                                      time: doc.get('messageTime'),
                                    );
                            },
                          )
                        : Container();
                  }),
            ),
            InputTextFieldWidget(chatRoomId: widget.chatRoomId),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBarWidget(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MainColors.creamWhite,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatars/0.jpg'),
                maxRadius: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.userName,
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(fontWeight: FontWeight.w500)),
                    Text(widget.email,
                        style: MainTextStyles.smallInputBlockStyle
                            .copyWith(fontWeight: FontWeight.w500)),
                    Text("Online",
                        style: MainTextStyles.smallInputBlockStyle.copyWith(
                            color: MainColors.lightBlue, fontSize: 8)),
                  ],
                ),
              ),
              const Icon(Icons.call, color: MainColors.black),
              const SizedBox(width: 16.0),
              const Icon(Icons.videocam_rounded, color: MainColors.black),
              const SizedBox(width: 16.0),
              const Icon(Icons.more_vert, color: MainColors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftDialog({required String message, required String time}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            color: MainColors.lightGrey,
          ),
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: MainTextStyles.smallInputBlockStyle,
              ),
              Text(
                time,
                textAlign: TextAlign.start,
                style:
                    MainTextStyles.smallInputBlockStyle.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightDialog({required String message, required String time}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
            color: MainColors.deepBlue,
          ),
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: MainTextStyles.smallInputBlockStyle
                    .copyWith(color: MainColors.creamWhite),
              ),
              Text(
                time,
                textAlign: TextAlign.start,
                style: MainTextStyles.smallInputBlockStyle
                    .copyWith(fontSize: 10, color: MainColors.creamWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
