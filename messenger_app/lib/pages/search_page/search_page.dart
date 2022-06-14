import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/search_page/bloc/search_cubit.dart';
import 'package:messenger_app/pages/search_page/widgets/searched_user_widget.dart';

import '../../utils/main_colors.dart';
import '../../utils/main_text_styles.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
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
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(color: MainColors.grey),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context
                        .read<SearchCubit>()
                        .searchUser(searchController.text.trim()),
                    icon: const Icon(Icons.search),
                  ),
                ]),
              ),
            ),
            body: state is SearchFound
                ? ListView.builder(
                    itemCount: state.chatRoomList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SearchedUser(
                        index: index,
                        chatRoomModel: state.chatRoomList[index],
                      );
                    },
                  )
                : Container(),
          ),
        );
      },
    );
  }
}
