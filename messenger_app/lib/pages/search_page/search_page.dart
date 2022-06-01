import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/pages/search_page/widgets/searched_user_widget.dart';
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
                  var searchedUserData = searchedUsers[index].docs.first;
                  return SearchedUser(
                    index: index,
                    searchedUserId: searchedUserData.get('id'),
                    searchedUserName: searchedUserData.get('name'),
                    searchedUserEmail: searchedUserData.get('email'),
                  );
                },
              ),
      ),
    );
  }

  Future<void> searchItem() async {
    searchedUsers = [];
    FirebaseMethods.getUserByName(searchController.text).then((value) {
      if (value.docs.isNotEmpty) {
        searchedUsers.add(value);
      }
      setState(() {});
    });
  }
}
