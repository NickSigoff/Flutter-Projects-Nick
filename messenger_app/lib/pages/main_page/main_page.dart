import 'package:flutter/material.dart';
import 'package:messenger_app/pages/calls_page/calls_page.dart';
import 'package:messenger_app/pages/chats_page/chats_page.dart';
import 'package:messenger_app/pages/profile_page/profile_page.dart';
import 'package:messenger_app/pages/search_page/search_page.dart';
import 'package:messenger_app/utils/image_constants.dart';
import 'package:messenger_app/utils/main_text_styles.dart';

import '../../utils/main_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _bottomBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.chat_sharp, color: MainColors.grey),
        activeIcon: Icon(Icons.chat_sharp, color: MainColors.lightBlue),
        label: 'Chats'),
    BottomNavigationBarItem(
        icon: Icon(Icons.call, color: MainColors.grey),
        activeIcon: Icon(Icons.call, color: MainColors.lightBlue),
        label: 'Calls'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person, color: MainColors.grey),
        activeIcon: Icon(Icons.person, color: MainColors.lightBlue),
        label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
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
                _getBody(_currentIndex),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            _onTap(index);
          },
          items: [..._bottomBarItems],
        ),
      ),
    );
  }

  void _onTap(int index) {
    _currentIndex = index;
    setState(() {});
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const ChatsPage();
      case 1:
        return const CallsPage();
      case 2:
        return const ProfilePage();
      default:
        return Container();
    }
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
