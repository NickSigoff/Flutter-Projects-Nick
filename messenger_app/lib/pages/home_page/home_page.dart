import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/calls_page/calls_page.dart';
import 'package:messenger_app/pages/chats_page/chats_page.dart';
import 'package:messenger_app/pages/home_page/bloc/bottom_bar_cubit.dart';
import 'package:messenger_app/pages/search_page/search_page.dart';
import 'package:messenger_app/pages/settings_page/settings_page.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: MainColors.creamWhite,
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: false,
                  snap: true,
                  stretch: true,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildLogoWidget(),
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage())),
                          icon: const Icon(
                            Icons.search,
                            color: MainColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    IndexedStack(
                      index: state,
                      children: const [
                        ChatsPage(),
                        CallsPage(),
                        SettingsPage(),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap: (int index) {
                context.read<BottomBarCubit>().onTap(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_sharp, color: MainColors.grey),
                    activeIcon:
                        Icon(Icons.chat_sharp, color: MainColors.lightBlue),
                    label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.call, color: MainColors.grey),
                    activeIcon: Icon(Icons.call, color: MainColors.lightBlue),
                    label: 'Calls'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings, color: MainColors.grey),
                    activeIcon:
                        Icon(Icons.settings, color: MainColors.lightBlue),
                    label: 'Settings'),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _buildLogoWidget() {
    return Row(
      children: [
        Image.asset(
          ImageConstants.labelImage,
          width: 50,
          height: 50,
        ),
        Text(
          'Tapo',
          style: MainTextStyles.mediumGetStartedPageStyle
              .copyWith(color: MainColors.lightBlue, shadows: []),
        ),
      ],
    );
  }
}
