import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/utils/main_colors.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

class UserChatWidget extends StatefulWidget {
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;
  final int index;

  const UserChatWidget(
      {required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.name,
      required this.isMessageRead,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  State<UserChatWidget> createState() => _UserChatWidgetState();
}

class _UserChatWidgetState extends State<UserChatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatDetailsPage(userName: widget.name, email: '',)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            _buildFirstDivider(widget.index),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.imageUrl),
                        maxRadius: 30,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: MainTextStyles.smallInputBlockStyle
                                    .copyWith(
                                  color: MainColors.lightBlue,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.messageText,
                                style: MainTextStyles.smallInputBlockStyle
                                    .copyWith(
                                        fontSize: 12,
                                        fontWeight: widget.isMessageRead
                                            ? FontWeight.w400
                                            : FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.time,
                  style: MainTextStyles.smallInputBlockStyle.copyWith(
                      fontSize: 12,
                      fontWeight: widget.isMessageRead
                          ? FontWeight.w400
                          : FontWeight.bold),
                ),
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
