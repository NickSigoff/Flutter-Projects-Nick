import 'package:flutter/material.dart';
import 'package:weather_app_task/pages/main_page/widgets/tab_bar_widget/tab_button_widget.dart';

import '../../../../utils/main_colors.dart';


class TabBarWidget extends StatelessWidget {
  final Function onTap;
  final int selectedPage;

  TabBarWidget({Key? key, required this.onTap, required this.selectedPage})
      : super(key: key);

  final List<String> tabBarPagesNames = ['Today', 'Daily Details'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / tabBarPagesNames.length;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List<Widget>.generate(
              tabBarPagesNames.length,
              (index) => TabButton(
                pageNumber: index,
                onTap: () {
                  onTap(index);
                },
                selectedPage: selectedPage,
                width: width,
                text: tabBarPagesNames[index],
              ),
            )
          ],
        ),
        const Divider(
          height: 1.0,
          color: MainColors.unSelectedTextMainPage,
          thickness: 1.0,
        ),
      ],
    );
  }
}
