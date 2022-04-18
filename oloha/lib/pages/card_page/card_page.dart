import 'package:flutter/material.dart';
import 'package:oloha/pages/card_page/widgets/about_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/appbar_card_page.dart';
import 'package:oloha/pages/card_page/widgets/avatar_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/card_info_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/community_page_card_page.dart';
import 'package:oloha/pages/card_page/widgets/custom_tabbar_card_page.dart';
import 'package:oloha/pages/card_page/widgets/icon_features_card_page.dart';
import 'package:oloha/pages/card_page/widgets/location_widget_card_page.dart';
import 'package:oloha/pages/card_page/widgets/photo_page_card_page.dart';

import '../../utils/main_colors.dart';
import '../../utils/restourants.dart';
import 'widgets/review_page_card_page.dart';

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
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: MainColors.background,
          automaticallyImplyLeading: false,
          floating: false,
          pinned: true,
          snap: false,
          stretch: true,
          collapsedHeight: 60,
          expandedHeight: MediaQuery.of(context).size.height * 0.25,
          flexibleSpace: FlexibleSpaceBar(
            background: AppBarCardPage(item: item),
            stretchModes: const [
              StretchMode.blurBackground,
              //StretchMode.fadeTitle,
              //StretchMode.zoomBackground,
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTabBar(
                    item: item,
                    onTap: _onTapChangePage,
                    selectedPage: _selectedPage),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: pageList[_selectedPage],
                ),
              ],
            ),
          ]),
        ),
      ]),
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
