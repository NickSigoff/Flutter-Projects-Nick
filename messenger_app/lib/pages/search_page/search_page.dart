import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/chat_detail_page/chat_detail_page.dart';
import 'package:messenger_app/services/firebase_methods.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<QuerySnapshot> searchedUsers = [];

  Future<void> searchItem() async {
    searchedUsers = [];
    FirebaseMethods().getUserByName(searchController.text).then((value) {
      if (value.docs.isNotEmpty) {
        searchedUsers.add(value);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MainColors.creamWhite,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              const BackButton(
                color: MainColors.lightBlue,
              ),
              Expanded(
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: MainTextStyles.smallInputBlockStyle,
                  controller: searchController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Write to search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: MainColors.grey),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  await searchItem();
                },
                icon: const Icon(Icons.search),
              ),
            ]),
          ),
        ),
        body: searchedUsers.isEmpty
            ? Container()
            : ListView.builder(
          itemCount: searchedUsers.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SearchedUser(
              index: index,
              name: searchedUsers[index].docs.first.get('name'),
              email: searchedUsers[index].docs.first.get('email'),
            );
          },
        ),
      ),
    );
  }
}

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
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => ChatDetailsPage()));
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
