import 'package:flutter/material.dart';
import 'package:oloha/pages/card_page/widgets/about_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/appbar_card_page.dart';
import 'package:oloha/pages/card_page/widgets/avatar_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/card_info_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/icon_features_card_page.dart';
import 'package:oloha/pages/card_page/widgets/location_widget_card_page.dart';

import '../../utils/main_colors.dart';
import '../../utils/restourants.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int _selectedPage = 0;

  void _onTapChangePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Restaurant;

    List pageList = [
      OverviewPage(
        item: item,
      ),
      const PhotoPage(),
      const ReviewPage(),
      const CommunityPage(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            collapsedHeight: 100,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: AppBarCardPage(item: item),
          ),
          //SliverPersistentHeader(delegate: MySliverPersistentHeader()),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTabBar(
                      item: item,
                      onTap: _onTapChangePage,
                      selectedPage: _selectedPage),
                  pageList[_selectedPage],
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final Restaurant item;
  final Function onTap;
  final int selectedPage;

  const CustomTabBar(
      {Key? key,
      required this.item,
      required this.onTap,
      required this.selectedPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 0,
                onTap: () {
                  onTap(0);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  //color: Colors.red,
                  child: const Text(
                    'Overview',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 1,
                onTap: () {
                  onTap(1);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  // color: Colors.blue,
                  child: const Text(
                    'Photo',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 2,
                onTap: () {
                  onTap(2);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  // color: Colors.yellow,
                  child: const Text(
                    'Review',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 3,
                onTap: () {
                  onTap(3);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  // color: Colors.green,
                  child: const Text(
                    'Community',
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            color: MainColors.horizontalLine,
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final double width;
  final Widget child;
  final int selectedPage;
  final int pageNumber;
  final Function onTap;

  const TabButton(
      {Key? key,
      required this.onTap,
      required this.width,
      required this.child,
      required this.pageNumber,
      required this.selectedPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            child: child,
          ),
          Container(
            color: selectedPage == pageNumber
                ? MainColors.background
                : Colors.transparent,
            height: 4,
            width: width,
          ),
        ],
      ),
    );
  }
}

class OverviewPage extends StatelessWidget {
  final Restaurant item;

  const OverviewPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutWidgetCardPage(item: item),
        CardInfoWidget(item: item),
        IconFeatures(item: item),
        const LocationWidgetCardPage(),
        const AvatarLineWidget(),
      ],
    );
  }
}

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Photo'),
    );
  }
}

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('Review'),
        ),
        Container(
          color: Colors.yellow,
          height: 300,
          width: 200,
        ),
      ],
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Community'),
    );
  }
}
