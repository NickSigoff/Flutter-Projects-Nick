import 'package:flutter/material.dart';
import 'package:weather_app/pages/main_page/widgets/tab_bar_widget/tab_button_widget.dart';

class TabBarWidget extends StatelessWidget {
  final Function onTap;
  final int selectedPage;

  TabBarWidget({Key? key, required this.onTap, required this.selectedPage})
      : super(key: key);

  final List<String> tabBarPagesNames = ['Today', 'Daily Details', 'Calendar'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / tabBarPagesNames.length;

    return Row(
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
    );
  }
}
